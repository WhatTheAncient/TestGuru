class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  scope :correct, -> { where(correct: true) }
end
