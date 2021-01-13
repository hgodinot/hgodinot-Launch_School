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

# Another way to do it:

class House
  SONG_SIZE = 12

  def self.recite
    house = self.new
    house.recite
  end
  
  def recite
    result = []
    pieces.each_with_index do |verse, idx|
      str = ""
      str << "This is " + verse.first + "\n"
      while idx < SONG_SIZE - 1
        str << pieces[idx].last + " " + pieces[idx + 1].first + "\n"
        idx += 1
      end
      result << str.chomp + "."
    end
    result.reverse.join("\n\n") << "\n"
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

# With Arrays of subarrays and increasing chorus

class House
  def self.recite
    House.new.sing
  end
  
  def initialize
    @song = Array.new
    @chorus = Array.new
  end
  
  def sing
    -1.downto(-pieces.size) { |idx| compose_verse(idx) }
    @song.map { |verse| verse.join("\n") << "." }.join("\n\n") << "\n"
  end
  
  def compose_verse(idx)
    @song << ["This is #{pieces[idx].first}"]
    add_line(idx) if @song.size > 1
    add_chorus unless @chorus.empty?
    actualize_chorus if @song.size > 1
  end
  
  def add_line(idx)
    @song.last << ["#{pieces[idx].last} #{pieces[idx + 1].first}"]
  end
  
  def add_chorus
    @chorus.each { |line| @song.last << line }
  end
  
  def actualize_chorus
    @chorus.unshift(@song.last[1])
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