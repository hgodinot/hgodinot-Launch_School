class RunLengthEncoding
  def self.encode(str)
    str.gsub(/(.)\1+/)  { |match| match.size.to_s + match[0] }
  end
  
  def self.decode(str)
    str.gsub(/\d+\D/) { |match| match[-1] * match.to_i }
  end
end
