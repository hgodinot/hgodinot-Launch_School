class Crypto
  attr_reader :normalize_plaintext, :size
  
  def initialize(text)
    @normalize_plaintext = text.gsub(/\W/, "").downcase
    @size = Math.sqrt(@normalize_plaintext.size).ceil
  end
  
  def plaintext_segments
    @normalize_plaintext.scan(/.{1,#{@size}}/)
  end
  
  def ciphertext
    plaintext_segments.map do |wrd| 
      (@size - wrd.size).times { |_| wrd << " " }
      wrd
    end.map(&:chars).transpose.flatten.join.gsub(/\s+/, "")
  end
  
  def normalize_ciphertext
    text = ciphertext.chars
    array_size = [text.size / @size] * @size
    (text.size - array_size.sum).times { |i| array_size[i] += 1 }
    array_size.map { |n| [*1..n].map.with_object([]) { |_, arr| arr << text.shift}.join }.join(" ")
  end
end

#

class Crypto
  def initialize(str)
    @text = str.gsub(/[\W]/,"").downcase
  end
  
  def normalize_plaintext
    @text
  end
  
  def size
    Math.sqrt(@text.size).ceil
  end
  
  def plaintext_segments
    @text.scan(/.{1,#{size}}/)
  end
  
  def ciphertext
    array_sub = plaintext_segments.map(&:chars)
    (array_sub.first.size - array_sub.last.size).times { array_sub.last << "" }
    array_sub.transpose.join
  end

  def normalize_ciphertext
    plaintext_segments.map do |str|
      if str.size != plaintext_segments.first.size
        str << " " * (plaintext_segments.first.size - str.size)
      else
        str
      end
    end.map  { |str| str.chars}.transpose.map { |arr| arr.join.strip }.join(" ")                                               
  end
end