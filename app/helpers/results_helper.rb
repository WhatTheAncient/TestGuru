module ResultsHelper
  def formatted_timer(seconds)
    Time.at(seconds).strftime('%M:%S') if seconds.positive?
  end
end
