def solution(string)
  result = []
  str = ""
  string.chars.each_with_index do |value, index|
    str << value
    if str.length == 2
      result << str
      str = ""
    elsif str.length == 1 && index == (string.chars.length - 1)
      result << (str + "_")
    end
  end
  result
end


p solution('abc')
p solution('abcdef')