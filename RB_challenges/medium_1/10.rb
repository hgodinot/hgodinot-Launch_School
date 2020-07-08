class Prime
  attr_accessor :primes
  attr_reader :nth
  
  def self.nth(prime_nth)
    raise ArgumentError if prime_nth <= 0
    Prime.new(prime_nth).find_prime
  end

  def initialize(n)
    @nth = n
    @primes = [2]
  end
  
  def find_prime
    candidate = 3
    until primes.size == nth do
      factor = true
      primes.each do |prime| 
        factor = false if candidate % prime == 0
        break if prime >= Math.sqrt(candidate)
      end
      primes << candidate if factor
      candidate += 2
    end
    primes.last
  end
end

p Prime.nth(10_001)
p Prime.nth(1)
p Prime.nth(2)
p Prime.nth(3)
p Prime.nth(6)
p Prime.nth(0)