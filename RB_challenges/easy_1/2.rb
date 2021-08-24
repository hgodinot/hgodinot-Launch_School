class Sieve
  
  def initialize(number)
    @range = (2..number).to_a
  end
  
  def primes
    @range.each do |prime|
      @range.reject! { |number| number != prime && number % prime == 0 }
    end
  @range
  end
  
end

# or with a different algorythm, not following the Sieves one, but more efficient:

class Sieve
  def initialize(num)
    @primes = [2]
    @limit = num
  end

  def is_prime?(n)
    @primes.select{ |x| x <= Math.sqrt(n) }
           .all? { |x| n % x != 0}
  end

  def primes
    return [] if @limit < 2

    candidate = 3
    while candidate <= @limit do
      @primes << candidate if is_prime?(candidate)
      candidate += 2
    end

  @primes
  end
end