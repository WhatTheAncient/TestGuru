class CreateBadgeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_categories do |t|
      t.string :title, null: false

      t.timestamps
    end

    remove_column :badges, :category, :string
    add_column :badges, :category_id, :bigint, foreign_key: { to_table: :badge_categories }
  end
end
