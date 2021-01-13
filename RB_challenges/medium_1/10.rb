class Prime
  def self.nth(rank)
    raise ArgumentError if rank < 1 || rank.class != Integer
    primes = [2]
    candidate = 3
    while primes.length < rank
      primes << candidate unless primes.take_while { |x| x <= Math.sqrt(candidate) }
      .any? { |prime| candidate % prime == 0 }
      candidate += 2
    end
    primes.last
  end
end