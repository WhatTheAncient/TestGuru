class DeleteBadgesFromResults < ActiveRecord::Migration[6.1]
  def change
    remove_column :results, :badge_id
  end
end
