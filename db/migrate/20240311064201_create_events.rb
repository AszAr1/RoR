class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :description
      t.string :category_id

      t.timestamps
    end
  end
end
