def star(n)
  sides = (n / 2)
  (sides - 1).downto(0) do |i|
    print " " * (sides - 1 - i)
    print "*"
    print " " * i
    print "*"
    print " " * i
    print "*\n"
  end
  print "*" * n + "\n"
  0.upto(sides - 1) do |i|
    print " " * (sides - 1 - i)
    print "*"
    print " " * i
    print "*"
    print " " * i
    print "*\n"
  end
end

star(7)