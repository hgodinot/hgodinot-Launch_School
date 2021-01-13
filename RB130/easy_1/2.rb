def compute
  block_given? ? yield : "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute_two(arg)
  return yield(arg) if block_given?
  "Does not compute"
end

p compute_two("a") { |arg| arg + "d"}
p compute_two("a")
p compute_two(4) { |num| num + 6 }