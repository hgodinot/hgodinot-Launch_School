# Most elegant solution:

class Integer
  ROMANS = [["I", "V"], ["X", "L"], ["C", "D"], ["M"]]

  def to_roman
    return "Roman Numbers can't be more than 3999" if self >= 4000

    self.digits
        .reverse
        .map
        .with_index { |x, i| digit_to_roman(x, self.to_s.size - i - 1) }
        .join("")
  end

  def digit_to_roman(num, idx)
    digits = ROMANS[idx]

    case num
    when 1..3 then digits[0] * num
    when 4    then digits[0] + digits[1]
    when 5..8 then digits[1] + digits[0] * (num- 5)
    when 9    then digits[0] + ROMANS[idx + 1][0]
    else           ''
    end
  end
end

# Other way, less elegant

class Integer
  UNITS = ['I', 'V', 'X']
  DECIMALS = ['X', 'L', 'C']
  HUNDREDS = ['C', 'D', 'M']
  THOUSANDS = ['M']
  
  def to_roman
    raise ArgumentError.new, "Roman numbers don't go past 3999" if self > 3999
    array = self.digits.map.with_index { |val, idx| val * 10 ** idx }.reverse
    array.each_with_object("") do |val, result|
      case val
      when 0..9     then table = UNITS
      when 10..90   then table = DECIMALS
      when 100..900 then table = HUNDREDS
      else               table = THOUSANDS
      end
      case val.digits.last
      when 0..3 then result << (table[0] * val.digits.last)
      when 4    then result << (table[0] + table[1])
      when 5..8 then result << (table[1] + table[0] * (val.digits.last - 5))
      else           result << (table[0] + table[2])
      end
    end
  end
end

# or in a more brute force way

class Integer
  
  CONVERSION = { 1000 => "M", 2000 => "MM", 3000 => "MMM",
  100 => "C", 200 => "CC", 300 => "CCC", 400 => "CD", 500 => "D",
  600 => "DC", 700 => "DCC", 800 => "DCCC", 900 => "CM",
  10 => "X", 20 => "XX", 30 => "XXX", 40 => "XL", 50 => "L", 
  60 => "LX", 70 => "LXX", 80 => 'LXXX', 90 => "XC",
  1 => "I", 2 => "II", 3 => "III", 4 => "IV", 5 => "V",
  6 => "VI", 7 => "VII", 8 => "VIII", 9 => "IX"}
  
  def to_roman
    raise ArgumentError.new("No number greater than 3999") if 
    self.class != Integer || self > 3999

    self.digits.map.with_index { |val, idx| val * 10 ** idx }.reverse
    .map { |digit| CONVERSION[digit] }.join
  end
end
