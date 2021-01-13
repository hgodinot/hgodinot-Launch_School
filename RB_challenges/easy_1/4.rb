class Trinary
  def initialize(str)
     @num = str.match(/[^0-2]/) ? 0 : str.to_i
  end
  
  def to_decimal
    @num.to_i.digits.reverse.reduce { |acc, val| acc * 3 + val }
  end
end