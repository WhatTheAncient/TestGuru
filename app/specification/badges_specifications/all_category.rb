module BadgesSpecifications
  class AllCategory < AbstractBadgeSpecification
    def satisfies?
      category = Category.find_by(title: @rule_params)
      user_tests = @result.user.tests.where(category: category).ids
      existing_tests = Test.where(category: category).ids

      existing_tests == user_tests.uniq && user_tests.group_by(&:itself).values.map(&:size).uniq.size == 1
    end
  end
end
