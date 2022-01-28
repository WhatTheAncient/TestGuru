class BadgesDeliveryService
  RECEIVE_CONDITIONS = {
    first_try: BadgesSpecifications::FirstTry,
    all_category: BadgesSpecifications::AllCategory,
    all_level: BadgesSpecifications::AllLevel
  }.freeze

  def initialize(result)
    @result = result
  end

  def build
    Badge.select do |badge|
      condition = RECEIVE_CONDITIONS[FormatService.to_sym_formatted(badge.rule)].new(result: @result,
                                                                                     rule_params: badge.rule_params)
      add_badges(badge) if condition.satisfies?
    end
  end

  private

  def add_badges(badge)
    @result.user.badges << badge
  end
end
