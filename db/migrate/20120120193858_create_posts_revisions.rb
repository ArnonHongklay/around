class CreatePostsRevisions < ActiveRecord::Migration
  def change
    create_table :posts_revisions do |t|
      t.string :title
      t.text :content
      t.string :url
      t.integer :user_id
      t.integer :post_id
      t.datetime :published_at

      t.timestamps
    end

    add_index :posts_revisions, :id, unique: true
    add_index :posts_revisions, :published_at
    add_index :posts_revisions, :post_id
  end
end
