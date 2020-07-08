class Octal
  def initialize(s)
    @string = s
  end
  
  def to_decimal
    return 0 if @string.match(/[^0-7]/)
    @string.to_i.digits.reverse.reduce(0) { |acc, val| acc * 8 + val  }
  end
end