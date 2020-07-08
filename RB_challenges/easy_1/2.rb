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
