module BadgesSpecifications
  class FirstTry < BadgeSpecification
    def satisfied?
      @result.user.results.where(test: @result.test).length == 1 && @result.passed?
    end
  end
end
