class Scrabble
  SCORE = { 
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'J, X' => 8,
    'Q, Z' => 10
  }

  def self.score(wrd)
    Scrabble.new(wrd).score
  end

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless valid_input?
    @word.upcase.chars.map { |char| score_letter(char) }.sum
  end

  private

  def valid_input?
     @word.class == String && !@word.match(/[^A-z]/)
  end

  def score_letter(char)
    SCORE.keys.map { |key| key.match(char)? SCORE[key] : 0 }.sum
  end
end
