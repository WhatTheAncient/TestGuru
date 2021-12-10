class Test < ApplicationRecord
  def self.tests_with_category(category)
    Test.joins("JOIN categories ON categories.id = tests.category_id").where("categories.title = ?", category).order("tests.level DESC")
  end
end
