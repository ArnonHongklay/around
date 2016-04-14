class Blog::Post < ActiveRecord::Base
  has_many :taggings
  has_many :tags, -> { order "id ASC" }, through: :taggings, dependent: :destroy
  before_validation :generate_url
  belongs_to :user

  scope :default,  -> { order("published_at DESC, blog_posts.created_at DESC, blog_posts.updated_at DESC") }
  scope :published, -> { where("published_at <= ?", DateTime.now) }

  default_scope{includes(:tags)}

  validates :user_id, presence: true
  validates :title, :content, :url, :published_at, presence: true
  validates :url, uniqueness: true
  validate :url_do_not_start_with_slash

  def tag_list= tags_attr
    self.tag!(tags_attr.split(","))
  end

  def tag_list
    self.tags.map { |tag| tag.name }.join(", ") if self.tags
  end

  def tag!(tags_attr)
    self.tags = tags_attr.map(&:strip).reject(&:blank?).map do |tag|
      Blog::Tag.where(name: tag).first_or_create
    end
  end

  def full_url
    "#{Rails.application.routes.url_helpers.blog_show_path}/#{self.url}"
  end

  def published_in_future?
    self.published && self.published_at > DateTime.now
  end

  def self.page p
    paged_results(p, Rails.application.config.posts_per_page || 10, false)
  end

  def self.listing_page(p)
    paged_results(p, Rails.application.config.posts_per_page || 50, true)
  end

  def self.total_pages
    @number_of_pages
  end

  def self.set_total_pages per_page
    @number_of_pages = self.count / per_page + (self.count % per_page == 0 ? 0 : 1)
  end

  private

  def self.paged_results(pa, per_page, admin)
    set_total_pages(per_page)
    pa = (pa.nil? ? 0 : pa.to_i - 1)
    offset = pa * per_page
    # if admin
    #   default.limit(per_page).offset(offset)
    # else
    limit(per_page).offset(offset)
    # end
  end

  def generate_url
    return unless self.url.blank?
    year = self.published_at.class == ActiveSupport::TimeWithZone ? self.published_at.year : DateTime.now.year
    self.url = "#{year}/#{self.title.parameterize}"
  end

  def url_do_not_start_with_slash
    errors.add(:url, I18n.t("activerecord.errors.models.blog/post.attributes.url.start_with_slash")) if self.url.start_with?("/")
  end
end
