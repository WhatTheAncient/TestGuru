class BadgesService
  RECEIVE_CONDITIONS = {
    first_try: BadgesSpecifications::FirstTry,
    all_category: BadgesSpecifications::AllCategory,
    all_level: BadgesSpecifications::AllLevel
  }.freeze

  def initialize(result)
    @result = result
    @badges = []
  end

  def badges
    set_received_badges
  end

  private

  attr_writer :badges
  attr_accessor :test

  def set_received_badges
    Badge.select do |badge|
      condition = RECEIVE_CONDITIONS[FormatService.to_sym_formatted(badge.rule)].new(result: @result, badge: badge)
      @badges << badge if condition.satisfied?
    end

    @badges
  end
end
