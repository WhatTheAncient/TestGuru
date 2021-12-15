class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  def self.tests_with_category(category_title)
    Test.joins("JOIN categories ON categories.id = tests.category_id")
        .where(categories: { title: category_title })
        .order(tests: :desc)
        .pluck(:title)
  end
end
