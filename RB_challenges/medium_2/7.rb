class RunLengthEncoding
  def self.encode(input)
    result = ""
    start_index = 0
    loop do
    counter = 1
    character = ""
      loop do
        character = input[start_index]
        start_index += 1
        break unless input[start_index] == character
        counter += 1
      end
      counter > 1 ? result << "#{counter}#{character}" : result << "#{character}"
      break if start_index == input.size
    end
    result
  end

  def self.decode(input)
    result = ""
    start_index = - 1
    loop do
      number = ""
      loop do
        start_index += 1
        break if start_index > input.size - 1
        if input[start_index].match(/\d/) 
          number << input[start_index]
        else
          number = "1" if number == ""
          result << input[start_index] * number.to_i
          break
        end
      end
      break if start_index > input.size - 1
    end
    result
  end
end
