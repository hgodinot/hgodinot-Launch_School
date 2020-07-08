require "pry"
class Crypto
  def initialize(str)
    @n_string = str.gsub(/\W/, "").downcase
    @size = Math.sqrt(@n_string.size).ceil
    
    remainder = @n_string.size % @size
    plain = @n_string.scan(/.{#{@size}}/) << @n_string[-remainder, remainder]
    @plain = remainder > 0 ? plain: plain[0..-2]
    
    @cypher = ""
    0.upto(plain[0].size - 1) { |idx| @plain.each { |val| @cypher << val[idx] if val[idx] } }
    
    column_length =  (@cypher.size.to_f / @size).ceil
    remainder = @cypher.size - (column_length - 1) * @size
    norm = @cypher.scan(/.{#{column_length}}/).join(" ") + " #{ @cypher[-remainder, remainder]}"
    @norm_cypher = remainder > 0 ? norm : norm[0..-2]
    
  end
  
  def normalize_plaintext
    @n_string
  end
  
  def size
    @size
  end
  
  def plaintext_segments
    @plain
  end
  
  def ciphertext
    @cypher
  end
  
  def normalize_ciphertext
    @norm_cypher
  end
  
  
end

crypto = Crypto.new('If man was meant to stay on the ground god would have given us roots')
   p crypto.ciphertext
   p crypto.normalize_ciphertext
 