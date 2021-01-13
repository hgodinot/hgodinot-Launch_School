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
    strand.scan(/.../).map { |c| of_codon(c) }.take_while { |v| v != "STOP" }
  end
end
