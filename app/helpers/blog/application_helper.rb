module Blog
  module ApplicationHelper
    include Rails.application.config.routes.url_helpers if ENV["RAILS_ENV"] == "test" # TODO: try and see why this is needed for specs to pass
    #Why aren't they loaded by default?
    include Blog::HtmlHelper
    include Blog::TagsHelper

    def blog_admin_form_for(object, options = {}, &block)
      binding.pry
      options[:builder] = BlogAdminFormBuilder
      form_for(object, options, &block)
    end

    def blog_accurate_title
      content_for?(:title) ? ((content_for :title) + " | #{Rails.application.config.site_name}") : Rails.application.config.site_name
    end

    def rss_head_link
      tag("link", href: blog_feed_url, rel: "alternate", title: "RSS", type: "application/rss+xml")
    end

    def rss_icon
      social_icon("rss", blog_feed_url, Rails.application.config.show_rss_icon)
    end

    def github_icon
      social_icon("github", "http://github.com/#{Rails.application.config.github_username}", Rails.application.config.github_username)
    end

    def twitter_icon
      social_icon("twitter", "http://twitter.com/#{Rails.application.config.twitter_username}", Rails.application.config.twitter_username)
    end

    def linkedin_icon
      social_icon("linkedin", Rails.application.config.linkedin_url, Rails.application.config.linkedin_url)
    end

    def googleplus_icon
      social_icon("google-plus", Rails.application.config.google_plus_account_url, Rails.application.config.google_plus_account_url)
    end

    def facebook_icon
      social_icon("facebook", Rails.application.config.facebook_url, Rails.application.config.facebook_url)
    end

    def absolute_image_url(url)
      return url if url.starts_with? "http"
      request.protocol + request.host + url
    end

    def social_icon(foundicon, url, setting)
      return if setting.nil? || !setting
      content_tag :a, href: url, class: "social", target: "_blank" do
        content_tag :i, class: "foundicon-#{foundicon}" do # using an empty content tag for foundicons to appear. TODO: try to do otherwise and use only tag method
        end
      end
    end
  end
end
