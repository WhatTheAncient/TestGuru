class User < ApplicationRecord

  def get_tests_history(level) #Returns started and finished tests
    Test.joins("JOIN results ON results.test_id = tests.id")
        .where(results: { user_id: self.id }, tests: { level: level })
  end

end
