#Would even be simpler with the #sample method
a = %w[0 1 2 3 4 5 6 7 8 9 a b c d e f]
result = ""
8.times { result += a[rand(16)] }
result += "-"
3.times do
  4.times { result += a[rand(16)] }
  result += "-"
end
12.times { result += a[rand(16)] }
result

#Each UUID consists of 32 hexadecimal characters, and is typically broken into 
#5 sections like this 8-4-4-4-12 and represented as a string.
#f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91
