class Anagram
  def initialize(str)
    @word = str.downcase
  end
  
  def match(array)
    array.select { |word| anagram?(word) }.sort
  end
  
  private
  
  def anagram?(word)
    word.downcase != @word && word.downcase.chars.sort == @word.chars.sort
  end
end
