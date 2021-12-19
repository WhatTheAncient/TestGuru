class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  validate :validate_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_count
    errors.add(:answers_count) unless (1..4).include? question.answers.count + 1
  end
end
