class Trinary
  def initialize(s)
    @string = s
  end
  
  def to_decimal
    return 0 if @string.match(/[^0-2]/)
    @string.to_i.digits.reverse.reduce(0) { |acc, val| acc * 3 + val }
  end
end