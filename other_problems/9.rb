# Write a method that will determine whether an integer is a prime. Do not use the Prime class.

def is_prime?(n)
  return false if n <= 1
  (2..(n - 1)).each do |x|
    return false if n % x == 0
  end
  true
end

# Write a method that will take an array of methods and only return those that are prime. 
def select_primes(arr)
  arr.select {|x| is_prime?(x)}
end

# Write a method that will take an array of numbers and return the number of primes in the array.

def count_primes(arr)
  select_primes(arr).size
end

p count_primes([1, 2, 3, 4]) == 2
p count_primes([4, 6, 8, 10]) == 0

