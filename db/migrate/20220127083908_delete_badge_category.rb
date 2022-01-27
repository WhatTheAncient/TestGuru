class DeleteBadgeCategory < ActiveRecord::Migration[6.1]
  def change
    drop_table :badge_categories
  end
end
