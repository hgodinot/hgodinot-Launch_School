#hsh_prime = { 1 => true, 2 => false, 3 => true }

def is_prime(num)
  #return hsh_prime[num] if hsh_prime[num] != nil
  return false if num.even?
  (3..(num-1)).step(2).to_a.each do |x|
    if num % x == 0
      #hsh_prime[num] = false
      return false
    end
  end
  #hsh_prime[num] = true
  true
end

def gap(g, m, n)
  prime1 = prime2 = 0
  
  (m..n).to_a.each do |x|
    if is_prime(x)
      if (is_prime(x + g) && (x + g) <= n)
        if ((x + 1)...(x + g)).to_a.none? {|y| is_prime(y)}
          prime1, prime2 = x, (x + g)
          return [prime1, prime2]
        end
      end
    end
  end
  nil
end


p gap(2,100,110) == [101, 103]
p gap(4,100,110) == [103, 107]
p gap(6,100,110) == nil
p gap(8,300,400) == [359, 367]
p gap(10,300,400) == [337, 347]

=begin
def is_prime(num)
  return true if num == 1 || num == 2 || num == 3
  return false if num.even?
  (3..(num-1)).step(2).to_a.each do |x|
    return false if num % x == 0
  end
  true
end

def gap(g, m, n)
  prime1 = prime2 = 0
  primes = (m..n).to_a.select { |x| is_prime(x) }
  p primes
  
  (primes.length - 2).times do |index|
    if primes[index + 1] - primes[index] == g
    prime1, prime2 = primes[index], primes[index + 1]
    break
    end
  end
  
  return nil if prime1 == 0
  [prime1, prime2]
end
=end