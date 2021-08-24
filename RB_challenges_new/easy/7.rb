class Octal
  def initialize(num)
    @num = num.match(/[^0-7]/)? '0' : num
  end

  def to_decimal
    @num.chars.map(&:to_i).reduce { |sum, num| sum * 8 + num }
  end
end