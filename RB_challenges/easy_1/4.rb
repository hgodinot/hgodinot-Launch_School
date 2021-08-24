class Trinary
  def initialize(str)
    @arr = str.match(/[^0-2]/) ? [0] : str.chars.map(&:to_i)
  end

  def to_decimal
    @arr.reduce { |acc, n| acc * 3 + n }
  end
end