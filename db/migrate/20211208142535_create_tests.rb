class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, limit: 30, null: false
      t.integer :level
      t.integer :category_id
      t.integer :author_id

      t.timestamps
    end

    change_column_default :tests, :level, 1
  end
end
