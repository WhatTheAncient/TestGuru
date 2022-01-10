module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(text:, author:, repo:)
    link_to text, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow', rel: 'noopener'
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type.to_s}"
  end
end
