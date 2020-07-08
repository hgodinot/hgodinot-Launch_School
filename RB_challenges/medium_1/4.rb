class InvalidCodonError < StandardError; end

class Translation
  CONVERSION = 
  { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine', 'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine',
    'UCA' => 'Serine', 'UCG' => 'Serine', 'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine', 'UGC' => 'Cysteine', 'UGG' => 'Tryptophan',
    'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP' }
  
  def self.of_codon(codon)
    CONVERSION.fetch(codon) {fail InvalidCodonError} 
  end
  
  def self.of_rna(strand)
    strand.scan(/.../).take_while { |codon| of_codon(codon) != 'STOP' }
                      .map { |codon| of_codon(codon) }
  end
end

=begin
Original solution
class Translation
  CONVERSION = 
  { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine', 'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine',
    'UCA' => 'Serine', 'UCG' => 'Serine', 'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine', 'UGC' => 'Cysteine', 'UGG' => 'Tryptophan',
    'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP' }
  
  def self.of_codon(codon)
    raise InvalidCodonError if CONVERSION[codon] == nil || codon.size > 3
    CONVERSION[codon]
  end
  
  def self.of_rna(strand)
    result = []
    start = 0
    raise InvalidCodonError if CONVERSION[strand[0, 3]] == nil || strand.size < 3
    loop do
      break if CONVERSION[strand[start, 3]] == 'STOP' || strand[start] == nil
      result << CONVERSION[strand[start, 3]]
      start += 3
    end
    result.pop if result.last == 'STOP'
    result
  end
  
end

class InvalidCodonError < StandardError; end
=end
