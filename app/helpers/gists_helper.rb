module GistsHelper
  def hash(url)
    /\w{7,}/.match(url)
  end
end