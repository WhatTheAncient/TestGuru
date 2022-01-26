class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, limit: 100, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
