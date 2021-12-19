class User < ApplicationRecord
  has_many :created_tests, inverse_of: :author, class_name: 'Test',
                           foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  def tests_history(level) #Returns started and finished tests
    tests.where(level: level)
  end
end
