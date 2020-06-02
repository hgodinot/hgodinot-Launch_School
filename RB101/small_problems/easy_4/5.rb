def multisum(num, array = [])
  1.upto(num).each do |i|
    if i % 3 == 0 || i % 5 == 0
      array << i
    end
  end
  array.sum
end

multisum(3)
multisum(5)
multisum(10)
multisum(1000)
