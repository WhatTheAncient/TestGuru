class AddColumnToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :category, :string, null: false
    add_column :badges, :params, :string
  end
end
