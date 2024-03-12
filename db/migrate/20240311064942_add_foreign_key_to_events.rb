class AddForeignKeyToEvents < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :category_id, :integer, using: 'category_id::integer'
    add_foreign_key :events, :categories, column: :category_id
  end
end
