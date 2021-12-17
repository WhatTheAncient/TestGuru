class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', inverse_of: :created_tests
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.tests_with_category(category_title)
    Test.joins(:category)
        .where(category: { title: category_title })
        .order(tests: :desc)
        .pluck(:title)
  end
end
