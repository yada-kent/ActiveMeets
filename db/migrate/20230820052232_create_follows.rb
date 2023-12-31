class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false
      t.integer :followee_id, null: false
      t.timestamps
    end

    # インデックスの追加
    add_index :follows, :follower_id
    add_index :follows, :followee_id
    add_index :follows, [:follower_id, :followee_id], unique: true

  end
end
