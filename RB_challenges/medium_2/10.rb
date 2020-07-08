class Diamond
  def self.make_diamond(letter)
    diamond = Diamond.new(letter)
    diamond.make_diamond
  end
  
  def initialize(letter)
    @letter = letter
    @spaces = letter.ord - 65
  end
  
  def make_diamond
    first_half = second_half = "#{" " * @spaces}A#{" " * @spaces}\n"
    return first_half if @letter == "A"
    counter = 0
    
    loop do
      counter += 1
      break if counter == @spaces
      new_line = make_new_line(counter)
      first_half += new_line
      second_half = new_line + second_half
    end
    
    middle_line = make_middle_line(counter)
    (first_half + middle_line + second_half)
  end
  
  def make_new_line(counter)
    "#{" " * (@spaces - counter)}#{(65 + counter).chr}"\
    "#{" " * (((counter - 1) * 2) + 1)}"\
    "#{(65 + counter).chr}#{" " * (@spaces - counter)}\n"
  end
  
  def make_middle_line(counter)
    "#{@letter}#{" " * (((counter - 1) * 2) + 1)}#{@letter}\n"
  end
end
