def spacing(extremities, number, between)
  print("#{extremities}")
  (number + 2).times do
    print("#{between}")
  end
  print("#{extremities}\n")
end

def print_in_box(string)
  size = string.length
  spacing("+", size, "-")
  spacing("|", size, " ")
  print"| "
  print string
  print" |\n"
  spacing("|", size, " ")
  spacing("+", size, "-")
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')