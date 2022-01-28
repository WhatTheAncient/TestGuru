class AbstractBadgeSpecification
  def initialize(result:, rule_params:)
    @result = result
    @rule_params = rule_params
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end
