class User < ApplicationRecord

  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy

  def get_tests_history(level) #Returns started and finished tests
    self.tests
        .where(level: level)
  end

end
