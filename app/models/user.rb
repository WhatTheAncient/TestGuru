# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable,
         :trackable,
         :validatable

  has_many :created_tests, inverse_of: :author, class_name: 'Test',
                           foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :badges, through: :results, dependent: :destroy
  has_many :gists, dependent: :destroy

  def tests_history(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
