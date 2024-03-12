class AddUserIdToCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :user_id, :integer
    add_foreign_key :categories, :users, column: :user_id 
  end
end
