class Integer
  def to_roman
    raise ArgumentError.new("Too big, roman numbers only go up to 3999 (MMMCMXCIX)") if self > 3999
    num_to_units = {1 => [1], 2 => [1, 1], 3 => [1, 1, 1], 4 => [1, 5] , 5 => [5],
                  6 => [5, 1], 7 => [5, 1, 1], 8 => [5, 1, 1, 1], 9 => [1, 10]}
    num_to_rom = { 1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}
    
    numbers = self.to_s.chars.map.with_index do |x, idx|
      if x != '0'
        [x.to_i, 10 ** ((self.to_s.chars.length) - idx - 1)]
      end
    end
    numbers.delete(nil)
    numbers.map! do |subarray|
      [num_to_units[subarray[0]], subarray[1]]
    end
    numbers.map! do |subarray|
      subarray[0].map do |unit|
        unit * subarray[1]
      end
    end
    numbers.map! do |subarray|
      subarray.map do |unit|
        num_to_rom[unit]
      end
    end
    numbers.join
  end

  def self.from_roman(string)
    1.upto(3999) do |x|
      return x if x.to_roman == string
    end
    "It appears your roman number is not valid. Roman numbers only goes up to MMMCMXCIX"
  end
end
