class AddIndexToPostsRevisionUrl < ActiveRecord::Migration
  def change
    add_index :posts_revisions, :url
  end
end
