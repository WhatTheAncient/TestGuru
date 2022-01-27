module BadgesSpecifications
  class AllCategory
    def satisfied?
      category = Category.find_by(title: @badge.rule_params)

      @result.user.tests.where(category: category).uniq.length == Test.where(category: category).length
    end
  end
end
