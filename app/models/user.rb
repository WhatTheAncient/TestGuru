# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, inverse_of: :author, class_name: 'Test',
                           foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  validates :name, presence: true
  validates :email, presence: true, format: { with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/i }

  def tests_history(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
