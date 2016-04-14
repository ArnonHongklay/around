class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :post_id, :tag_id
    end

    add_index :taggings, :post_id
    add_index :taggings, :tag_id

  end
end
