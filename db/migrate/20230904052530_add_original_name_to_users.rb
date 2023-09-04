class AddOriginalNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :original_name, :string
  end
end
