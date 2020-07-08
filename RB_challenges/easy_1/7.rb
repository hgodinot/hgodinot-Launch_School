class DNA
  def initialize(dna)
    @dna = dna.chars
  end
  
  def hamming_distance(strand)
    limit = [strand.size, @dna.size].min
    @dna[0, limit].select.with_index { |val, idx| val != strand[idx] }.count
  end
end