class SecretHandshake
  MOVES = ["wink", "double blink", "close your eyes", "jump"]
  def initialize(number)
    @array = number.to_i.to_s(2).chars.reverse
  end
  
  def commands
    result = @array.map.with_index { |val, idx| MOVES[idx] if val == "1" } - [nil]
    @array.size >= 5 ? result.reverse : result
  end
end