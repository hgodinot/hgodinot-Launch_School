# Write a method that takes two numbers. Return an array containing all primes between the two numbers 
# (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.

def is_prime(n)
  return false if n <= 1
  return true if n == 2
  2.upto(n - 1) do |x|
    return false if n % x == 0
  end
  true
end

def find_primes(n1, n2)
  result = []
  n1.upto(n2) do |x|
    result << x if is_prime(x)
  end
  result
end

p find_primes(3, 10) == [3, 5, 7]
p find_primes(11, 20) == [11, 13, 17, 19]
p find_primes(100, 101) == [101]
p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

