module BadgesSpecifications
  class FirstTry < AbstractBadgeSpecification
    def satisfies?
      @result.user.results.where(test: @result.test).count == 1 && @result.passed
    end
  end
end
