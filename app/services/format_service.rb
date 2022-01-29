class FormatService
  def self.to_s_titleized(symbol)
    symbol.to_s.split('_').join(' ').titleize
  end

  def self.to_sym_formatted(string)
    string.tr(' ', '_').downcase.to_sym
  end
end
