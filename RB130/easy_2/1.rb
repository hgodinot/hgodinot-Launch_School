def step(min, max, range)
  loop do
    yield min
    min += range
    break if min > max
  end
  min
end

step(1, 10, 3) { |value| puts "value = #{value}" }