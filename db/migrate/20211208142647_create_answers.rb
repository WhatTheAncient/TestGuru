class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :title, limit: 25, null:false
      t.integer :question_id
      t.boolean :correct

      t.timestamps
    end
    change_column_default :answers, :correct, false
  end
end
