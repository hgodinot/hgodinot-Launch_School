class RomanNumeral
  ROMANS = { 0 => ["I", "V", "X"], 1 => ["X", "L", "C"], 2 => ["C", "D", "M"], 3 => ["M"]}

  def initialize(num)
    @num = num
    raise ArgumentError.new "Number must be an integer between 1 and 3000" unless valid?
  end

  def to_roman
    array = @num.digits
    array.map.with_index { |x, idx| digit_to_roman(x, idx)}.reverse.join
  end

  def digit_to_roman(num, index)
    romans = ROMANS[index]

    case num
    when (1..3) then romans[0] * num
    when 4      then romans[0] + romans[1]
    when (5..8) then romans[1] + romans[0] * (num - 5)
    when 9      then romans[0] + romans[2]
    else             ""
    end
  end

  private
  
  def valid?
    @num.class == Integer && ((1..3000).include? @num)
  end
end