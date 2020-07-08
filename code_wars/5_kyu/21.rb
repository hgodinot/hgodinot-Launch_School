class Primes
  def self.prime?(x, array)
     array[1..-1].each do |i|
      return false if x % i == 0
    end
    true
  end
  
  def self.first(n)
    return [2] if n == 1
    result = [2, 3]
    x = 5
    loop do
      break if result.size == n
      result << x if prime?(x, result)
      x += 2
    end
    result
  end
end

p Primes.first(1)
# => [2]

p Primes.first(2)
# => [2, 3]

p Primes.first(5)
# => [2, 3, 5, 7, 11]

p Primes.first(20).last(5)
# => [53, 59, 61, 67, 71]

p Primes.first(10000)

