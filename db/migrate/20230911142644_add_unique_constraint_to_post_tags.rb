class AddUniqueConstraintToPostTags < ActiveRecord::Migration[6.1]
  def change
    add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end
