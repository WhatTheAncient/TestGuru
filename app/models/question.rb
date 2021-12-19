class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :title, presence: true

  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:answers_count) unless (1..4).include? self.answers.count
  end
end
