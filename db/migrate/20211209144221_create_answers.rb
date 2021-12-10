class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :title, limit: 25, null: false
      t.boolean :correct, null: false, default: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
