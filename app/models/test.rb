class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', inverse_of: :created_tests
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  scope :tests_with_category, ->(category_title) { joins(:category).where(category: { title: category_title })
                                                                  .order(tests: :desc) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 4..Float::INFINITY) }

  def self.names_from_category(category_title)
    tests_with_category(category_title).pluck(:title)
  end
end
