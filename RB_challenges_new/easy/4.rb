class Anagram
  def initialize(word)
    raise ArgumentError.new "Argument must be a word" if word.class != String
    @word = word
  end

  def match(arr)
    sorted_word = @word.downcase.chars.sort.join
  
    no_duplicate_array(arr).select do |candidate|
      candidate.downcase.chars.sort.join == sorted_word && #Anagram
      candidate.downcase != @word.downcase #Not the same word 
    end
  end

  def no_duplicate_array(arr) #No duplicate words when being case insensitive
    case_insensitive_array = arr.map(&:downcase)
    
    arr.select.with_index do |candidate, idx|
      idx == 0 || case_insensitive_array[0, idx].none? do |word|
        word.downcase == candidate.downcase
      end
    end
  end
end

