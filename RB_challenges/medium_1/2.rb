class Luhn
  def initialize(n)
    @n = n
  end
  
  def addends
    @n.digits.map.with_index do |val, idx| 
      idx.odd? ? val > 4 ? val * 2 - 9 : val * 2 : val 
    end.reverse
  end
  
  def checksum
    addends.sum
  end
  
  def valid?
    checksum % 10 == 0
  end
  
  def self.create(n)
     (0..9).each { |x| return (n * 10 + x) if Luhn.new(n * 10 + x).valid? }
  end
end