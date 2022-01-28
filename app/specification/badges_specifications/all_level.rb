module BadgesSpecifications
  class AllLevel < AbstractBadgeSpecification
    def satisfies?
      level = @rule_params.to_i
      user_tests = @result.user.tests.where(level: level).ids
      existing_tests = Test.where(level: level).ids

      existing_tests == user_tests.uniq && user_tests.group_by(&:itself).values.map(&:size).uniq.size == 1
    end
  end
end
