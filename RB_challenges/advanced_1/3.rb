class Cipher
  attr_reader :key
  
  def initialize(key = nil)
    @key = !key ? create_key : key
    raise ArgumentError if @key.match(/[A-Z\d]/) || @key.strip == ""
    @key_arr = @key.chars.map { |char| char.ord - 97 }
  end
  
  def create_key
    length = [*100..200].sample # Random key of 100 to 200 characters
    length.times.each_with_object("") { |_, key| key << [*"a".."z"].sample }
  end
  
  def encode(text)
    code(text, :+)
  end
  
  def decode(text)
    code(text, :-)
  end
  
  def code(text, ope)
    text.chars.map.with_index { |chr, idx| convert(chr, @key_arr[idx], ope) }.join
  end
  
  def convert(char, keynum = 0, ope) # No letter modification if key not long enough
    (97 + (char.ord - 97).send(ope, keynum) % 26).chr
  end
end
# Similar way to do it
=begin
class Cipher
  attr_reader :key

  def initialize(key = nil)
    raise ArgumentError, 'Incorrect character(s) in key' if
    key && !key.chars.all? { |char| char.match(/[a-z]/) } || key&.empty?
    @key = key.nil? ? create_key : key
    @arr_key = create_key_array(@key)
  end

  def create_key
    key_size = [*100..150].sample # Random key of 100 to 150 random characters
    [*1..key_size].each_with_object("") { |_, str| str << [*"a".."z"].sample }
  end

  def create_key_array(str)
    str.chars.map { |chr| chr.ord - 97 }
  end

  def encode(str)
    str.chars.map.with_index { |chr, idx| convert(chr, idx, true) }.join
  end

  def decode(str)
    str.chars.map.with_index { |chr, idx| convert(chr, idx) }.join
  end

  def convert(chr, idx, encode = false)
    if encode
      (97 + (chr.ord - 97 + @arr_key[idx]) % 26).chr
    else
      (97 + (chr.ord - 97 - @arr_key[idx]) % 26).chr
    end
  end
end
=end