flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
idx = 0
result = nil

loop do
  if flintstones[idx][0..1] == "Be"
    result = idx
    break
  else
    break if idx == flintstones.length - 1
    idx += 1
  end
end
result

flintstones2 = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones2.each_with_index do |value, index|
  if value[0..1] == "Be"
  p index
  end
end

flintstones3 = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones3.index { |name| name[0..1] == "Be" }