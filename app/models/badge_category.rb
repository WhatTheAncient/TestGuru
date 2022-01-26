class BadgeCategory < ApplicationRecord
  has_many :badges, inverse_of: :category, dependent: :destroy
end
