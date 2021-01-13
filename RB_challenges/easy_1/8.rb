class Phrase
  def initialize(str)
    @array = str.downcase.gsub(/[^\w']/, " ").gsub(/( '|' )/, " ").split
  end
  
  def word_count
    @array.each_with_object(Hash.new(0)) { |word, hsh| hsh[word] += 1 }
  end
end
