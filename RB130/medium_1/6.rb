#a_proc = Proc.new { |x| x.to_s(8).to_i }
# p [8, 10, 12, 14, 16, 33].map(&a_proc)

def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc )
