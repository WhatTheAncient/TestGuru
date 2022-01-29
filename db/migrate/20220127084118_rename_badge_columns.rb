class RenameBadgeColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :badges, :category_id, :rule
    change_column :badges, :rule, :string
    rename_column :badges, :params, :rule_params
  end
end
