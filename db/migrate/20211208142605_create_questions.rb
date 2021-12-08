class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, limit: 50, null: false
      t.integer :test_id

      t.timestamps
    end
  end
end
