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

=begin 
Shorter version but less human friendly

class Diamond
  def self.make_diamond(letter)
    limit = letter.ord - 65
    left_side = ["A".center(2 * limit + 1) + "\n"]
    return left_side[0] if limit == 0
    
    1.upto(limit - 1) do |diff|
      left = (65 + diff).chr.rjust(limit - diff + 1)
      left_side << (left + " " * (2 * diff - 1) + left.reverse + "\n")
    end
    
    middle = [letter + " " * (2 * limit - 1) + letter + "\n"]
    (left_side + middle + left_side.reverse).join
  end
end
=end