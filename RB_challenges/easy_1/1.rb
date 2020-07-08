class Series
  def initialize(string)
    @array = string.chars.map(&:to_i)
  end
  
  def slices(n)
    raise ArgumentError.new("Slice is longer than input.") if n > @array.size
    @array.each_cons(n).to_a
  end
end
