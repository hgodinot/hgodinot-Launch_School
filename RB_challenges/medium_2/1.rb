class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
    @palindromes = Hash.new { |hash, value| hash[value] = [] }
  end

  def generate
    [*@min..@max].repeated_combination(2)
                 .select { |prod| palindrome?(prod) }
                 .each { |prod| @palindromes[prod.reduce(:*)] << prod }
  end
  
  def palindrome?(arr)
    arr.reduce(:*).to_s ==  arr.reduce(:*).to_s.reverse
  end
  
  def smallest
    Factor.new(@palindromes.min)
  end
  
  def largest
    Factor.new(@palindromes.max)
  end
end

class Factor < Palindromes
  attr_reader :value, :factors
  def initialize(palindrome)
    @value = palindrome.first
    @factors = palindrome.last
  end
end

# Another way to do it, with struct

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @max = max_factor
    @min = min_factor
    @hsh = {}
  end

  def generate
    (@min..@max).to_a.repeated_combination(2).each do |candidates|
      actualise_factors(candidates) if palindrome?(candidates)
    end
  end

  def largest
    Struct.new(:value, :factors).new(largest_value, @hsh[largest_value])
  end
  
  def smallest
    Struct.new(:value, :factors).new(smallest_value, @hsh[smallest_value])
  end
  
  def largest_value
    @hsh.keys.max
  end
  
  def smallest_value
    @hsh.keys.min
  end
  
  private
  
  def palindrome?(array)
    array.reduce(:*).to_s == array.reduce(:*).to_s.reverse
  end
  
  def actualise_factors(array)
    @hsh.has_key?(array.reduce(:*)) ? @hsh[array.reduce(:*)] << array : @hsh[array.reduce(:*)] = [array]
  end
end

