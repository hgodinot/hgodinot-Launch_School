class SecretHandshake
  CONVERSION = { 1 => "wink", 10 => "double blink", 100 => "close your eyes",
                 1000 => "jump" }
  
  def initialize(n)
    @n = n
  end
  
  def commands
    return [] if @n.to_s.match(/[^0-9]/)
    array = @n.to_i.to_s(2).chars.map(&:to_i)
    array = array.map.with_index { |val, idx| val * 10 ** (array.size - idx - 1) }
    array.reverse! if array.first != 10000
    array.map { |val| CONVERSION[val] } - [nil]
  end
end