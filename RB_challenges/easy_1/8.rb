class Phrase
  def initialize(str)
    @phrase = str.downcase.gsub(/[^0-9a-z']/, " ").gsub(/ '|' /, " ").split
  end
  
  def word_count
    hsh = {}
    @phrase.each { |word| hsh[word] != nil ? hsh[word] += 1 : hsh[word] = 1 }
    hsh
  end
end
