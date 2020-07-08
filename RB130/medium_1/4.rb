def raptor_group(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)
raptor_group(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(", ")}"
end