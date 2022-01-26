class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  @user = User.find(9)
  @test = Test.find(8)

  def self.fetch_received(result)
    badges = []
    @user = result.user
    @test = result.test

    RECEIVE_CONDITIONS.each do |category, data|
      badges << Badge.where(category: to_s_format(category), params: data[:params]) if data[:condition]
    end

    badges
  end
  
  private

  attr_accessor :user, :test
  
  RECEIVE_CONDITIONS = {
    first_try:
      { condition: @user.results.where(test: @test).length == 1,
        params: @test.title },
    all_category:
      { condition: @user.tests.where(category: @test.category).uniq.length == Test.where(category: @test.category).length,
        params: @test.category.title },
    all_level:
      { condition: @user.tests.where(level: @test.level).uniq.length == Test.where(level: @test.level).length,
        params: @test.level.to_s },
    all_tests:
      { condition: @user.tests.uniq.length == Test.all.length,
        params: nil }
  }.freeze

  def self.to_s_format(symbol)
    symbol.to_s.split('_').join(' ').titleize
  end
end
