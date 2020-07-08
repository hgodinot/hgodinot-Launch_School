require "pry"
class House

  def self.recite
    house = House.new
    refrain = " " + house.new_lines(-1, 0) + ".\n"
    song = "This is" + refrain
  
    -2.downto(-house.length) do |idx|
      refrain.prepend(" " + house.new_lines(idx, 0) + "\n" + house.new_lines(idx, 1))
      song += "\nThis is" + refrain
    end
    song
  end
  
  def new_lines(idx1, idx2)
    pieces[idx1][idx2]
  end
  
  def length
    pieces.length
  end
  
  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
