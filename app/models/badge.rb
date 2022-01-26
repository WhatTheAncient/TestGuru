class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  def self.fetch_received(result)
    badges = []
    user = result.user
    test = result.test

    receive_conditions = {
      first_try:
        { condition: user.results.where(test: test).length == 1,
          params: test.title },
      all_category:
        { condition: user.tests.where(category: test.category).uniq.length == Test.where(category: test.category).length,
          params: test.category.title },
      all_level:
        { condition: user.tests.where(level: test.level).uniq.length == Test.where(level: test.level).length,
          params: test.level.to_s },
      all_tests:
        { condition: user.tests.uniq.length == Test.all.length,
          params: nil }
    }.freeze

    receive_conditions.each do |category, data|
      badges << Badge.where(category: to_s_format(category), params: data[:params]) if data[:condition]
    end

    badges
  end
  
  private

  def self.to_s_format(symbol)
    symbol.to_s.split('_').join(' ').titleize
  end
end
