class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, :rule, presence: true

  scope :rules, -> { pluck(:rule).uniq }
end
