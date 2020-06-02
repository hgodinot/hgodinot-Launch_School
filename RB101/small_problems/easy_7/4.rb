def swapcase(string)
  string.chars.map{|char| ("a".."z").include?(char) ? char.upcase : char.downcase}.join("")
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

=begin
def swapcase(string)
  new_string = ""
  index = 0
  
  (string.length).times do
    if string[index].match?(/[a-z]/)
      new_string << string[index].upcase
    elsif string[index].match?(/[A-Z]/)
      new_string << string[index].downcase
    else
      new_string << string[index]
    end
    index += 1
  end

  new_string
end
=end