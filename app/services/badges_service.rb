class BadgesService
  attr_reader :badges

  def initialize(result)
    @user = result.user
    @test = result.test
    @badges = []
    set_received_badges
  end

  private

  attr_writer :badges
  attr_accessor :user, :test

  def set_received_badges
    RECEIVE_CONDITIONS.each do |rule, data|
      if eval(data[:condition])
        badge = Badge.find_by(rule: ApplicationController.helpers.to_s_titleized(rule), rule_params: eval(data[:rule_params]))
        badges << badge
      end
    end
  end

  RECEIVE_CONDITIONS = {
    first_try:
      { condition: 'user.results.where(test: test).length == 1',
        rule_params: 'test.title' },
    all_category:
      { condition: 'user.tests.where(category: test.category).uniq.length == Test.where(category: test.category).length',
        rule_params: 'test.category.title' },
    all_level:
      { condition: 'user.tests.where(level: test.level).uniq.length == Test.where(level: test.level).length',
        rule_params: 'test.level.to_s' },
    all_tests:
      { condition: 'user.tests.uniq.length == Test.all.length',
        rule_params: 'nil' }
  }.freeze
end
