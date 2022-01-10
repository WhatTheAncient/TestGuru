class AddColumnsToResults < ActiveRecord::Migration[6.1]
  def change
    change_table :results do |t|
      t.references :current_question, foreign_key: { to_table: :questions }
      t.integer :correct_questions, default: 0
    end
  end
end
