class User < ApplicationRecord

  def get_started_tests(level) # Returns only started tests
    Test.joins("JOIN results ON results.test_id = tests.id")
        .where(results: { finished: false, user_id: self.id }, tests: { level: level })
  end

  def get_complited_tests(level) #Return only finished tests
    Test.joins("JOIN results ON results.test_id = tests.id")
        .where(results: { finished: true, user_id: self.id }, tests: { level: level })
  end

  def get_tests_history(level) #Returns started and finished tests
    get_started_tests(level) + get_complited_tests(level)
  end

end
