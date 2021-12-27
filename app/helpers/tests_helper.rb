module TestsHelper
  def test_level(test)
    if test.level <= 1
      'easy'
    elsif test.level <= 4
      'medium'
    else
      'hard'
    end
  end
end
