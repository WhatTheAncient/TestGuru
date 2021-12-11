class User < ApplicationRecord

  def get_started_tests(level)
    Test.joins("JOIN results ON results.test_id = tests.id").where("tests.level = ? AND results.finished = ? AND results.user_id = #{self.id}", level, false)
  end

  def get_complited_tests(level)
    Test.joins("JOIN results ON results.test_id = tests.id").where("tests.level = ? AND results.finished = ? AND results.user_id = #{self.id}", level, true)
  end

  def get_tests_history(level)
    get_started_tests(level) + get_complited_tests(level)
  end

end
