module BadgesSpecifications
  class AllLevel < BadgeSpecification
    def satisfied?
      level = @badge.rule_params.to_i

      @result.user.tests.where(level: level).uniq.length == Test.where(level: level).length
    end
  end
end
