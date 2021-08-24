class DNA
  def initialize(dna)
    @dna = dna.chars
  end
  
  def hamming_distance(str)
    @dna.select.with_index { |chr, idx| str[idx] && chr != str[idx] }.size
  end
end