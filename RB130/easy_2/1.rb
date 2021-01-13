def step(first, last, diff)
  while first <= last
    yield(first)
    first += diff
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }