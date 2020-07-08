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
