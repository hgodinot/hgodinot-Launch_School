def which_lights_on?(n)
  light_on = [false] * n

  n.times do |idx|
    ((idx )..(n-1)).step(idx + 1).to_a.each do |index|
      light_on[index] = !light_on[index] 
    end
  end

  light_on.map!.with_index { |boolean, index| (index + 1) if boolean}.delete(nil)
  light_on
end

p which_lights_on?(5)
p which_lights_on?(10)
