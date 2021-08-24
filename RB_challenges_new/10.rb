class Series
  def initialize(str)
    @array = str.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError.new if n > @array.size
    @array.each_cons(n).to_a
  end
end