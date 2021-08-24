class Octal
  def initialize(str)
    @arr = str.match(/[^0-7]/) ? [0] : str.chars.map(&:to_i)
  end

  def to_decimal
    @arr.reduce { |acc, n| acc * 8 + n }
  end
end