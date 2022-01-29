module BadgesHelper
  def show_rules
    rules = []

    BadgesDeliveryService::RECEIVE_CONDITIONS.each_key do |rule|
      rules << FormatService.to_s_titleized(rule)
    end

    rules
  end
end
