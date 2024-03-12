class AddUserIdToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :user_id, :integer
    add_foreign_key :events, :users, column: :user_id
  end
end
