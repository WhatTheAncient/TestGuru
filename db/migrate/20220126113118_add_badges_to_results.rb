class AddBadgesToResults < ActiveRecord::Migration[6.1]
    def change
      change_table :results do |t|
        t.belongs_to :badge, foreign_key: true
      end
    end
end
