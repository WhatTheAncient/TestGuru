class BadgesService
  attr_reader :badges

  def initialize(result)
    @result = result
    @test = result.test
    @badges = []
    set_received_badges
  end

  private

  attr_writer :badges
  attr_accessor :test

  def set_received_badges
    RECEIVE_CONDITIONS.each do |rule, data|
      if data[:condition].is_satisfied_by? @result
        badge = Badge.find_by(rule: ApplicationController.helpers.to_s_titleized(rule),
                              rule_params: eval(data[:rule_params]))
        badges << badge
      end
    end
  end

  RECEIVE_CONDITIONS = {
    first_try:
      { condition: Spec::BadgeSpec::FirstTry.new,
        rule_params: 'test.title' },
    all_category:
      { condition: Spec::BadgeSpec::AllCategory.new,
        rule_params: 'test.category.title' },
    all_level:
      { condition: Spec::BadgeSpec::AllLevel.new,
        rule_params: 'test.level.to_s' },
    all_tests:
      { condition: Spec::BadgeSpec::AllTests.new,
        rule_params: 'nil' }
  }.freeze
end
