class MergeRevisionsIntoPosts < ActiveRecord::Migration
  class Blog::PostsRevision < ActiveRecord::Base
  end

  class Blog::Post < ActiveRecord::Base
  end

  def up
    Blog::Post.reset_column_information
    add_column :posts, :title, :string
    add_column :posts, :content, :text
    add_column :posts, :url, :string
    add_column :posts, :published_at, :datetime
    remove_column :posts, :posts_revision_id
    add_index :posts, :url, unique: true

    Blog::Post.reset_column_information

    Blog::Post.all.each do |post|
      latest_revision =  latest_revision_for(post)
      post.title =latest_revision.title
      post.content =latest_revision.content
      post.url =latest_revision.url
      post.published_at =latest_revision.published_at
      post.save(validate: false)
    end

    drop_table :posts_revisions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private
  def latest_revision_for(post)
    Blog::PostsRevision.where("post_id = ?", post.id).order("posts_revisions.updated_at DESC").limit(1).first
  end
end
