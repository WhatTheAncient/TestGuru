module SessionsHelper
  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type.to_s}" if flash[type]
  end
end
