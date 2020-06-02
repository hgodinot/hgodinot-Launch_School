OPERATIONS = [:+, :-, :*, :%, :**]

def prompt(string)
  puts "==> #{string}"
end

prompt("Enter the first number:")
first = gets.chomp.to_i

prompt("Enter the second number:")
second = gets.chomp.to_i

OPERATIONS.each do |op|
  prompt("#{first} #{op} #{second} = #{first.send(op, second)}")
end
