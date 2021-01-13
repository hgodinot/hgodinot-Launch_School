class PhoneNumber 
  def initialize(str)
    @num = str.match(/[A-z]/) ? '0000000000': str.gsub(/[\D]/, '') 
  end
  
  def number
    return @num if @num.size == 10
    return @num[1..-1] if @num.size == 11 && @num[0] == "1"
    '0000000000'
  end
  
  def area_code
    number[0, 3]
  end
  
  def to_s
    number.gsub(/(...)(...)(....)/, '(\1) \2-\3')
  end
end

# Another way to do it

class PhoneNumber
  def initialize(str)
    @string = str.gsub(/\W/, '')
  end
  
  def number
    return '0000000000' if @string.match(/[^0-9]/) || 
                           ![10, 11].include?(@string.size) ||
                           @string.size == 11 && @string[0] != '1'
    @string.size == 11 ? @string[1, 10] : @string
  end
  
  def area_code
    @string[0, 3]
  end
  
  def to_s
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6, 4]}"
  end
end
