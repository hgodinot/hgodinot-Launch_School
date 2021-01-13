class RailFenceCipher
  def self.encode(str, rails)
    new(str, rails).encode
  end

  def self.decode(str, rails)
    new(str, rails).decode
  end

  def initialize(str, rails)
    clean_variables(str, rails) # To do several operations with same object
  end

  def clean_variables(str, rails)
    @str = str
    @rails = rails
    create_letters
    create_which_rail
  end

  def create_letters
    @letters = []
    @rails.times { |_| @letters << [] }
  end

  def create_which_rail
    result = [*0..@rails - 1] # First full side of the zig zag, going down
    loop do
      break if result.flatten.size >= @str.size # Full zig zag
      result << side_going_up
      result << side_goind_down
    end
    @which_rail = result.flatten[0, @str.size] # To get the right size
  end

  def side_going_up
    [*1..@rails - 2].reverse << 0
  end

  def side_goind_down
    [*1..@rails - 2] << (@rails - 1)
  end

  def encode
    @str.chars.each_with_index do |char, idx|
      @letters[@which_rail[idx]] << char
    end
    @letters.map(&:join).join
  end

  def decode
    parsed_array = parse_cypher
    fill_array(parsed_array)
    @which_rail.map { |idx| @letters[idx].shift }.join
  end

  def parse_cypher
    @letters.map.with_index { |_, idx| @which_rail.select { |x| x == idx }.size }
  end

  def fill_array(arr)
    characters = @str.chars
    arr.each_with_index { |val, idx| val.times { @letters[idx] << characters.shift } }
  end
end
