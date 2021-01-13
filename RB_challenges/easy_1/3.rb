class Octal
  def initialize(str)
    @num = str.match(/[^0-7]/) ? 0 : str.to_i
  end
  
  def to_decimal
    @num.digits.reverse.reduce(0) { |acc, val| acc * 8 + val  }
  end
end