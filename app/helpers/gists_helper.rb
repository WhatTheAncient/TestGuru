module GistsHelper
  def hash_gist(url)
    /\w{7,}/.match(url)
  end
end
