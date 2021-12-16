class Test < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  def self.tests_with_category(category_title)
    Category.find_by(title: category_title)
            .tests
            .order(level: :desc)
            .pluck(:title)
  end

end
