module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(text:, author:, repo:)
    link_to text, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow', rel: 'noopener'
  end

  def root_path
    '/'
  end
end
