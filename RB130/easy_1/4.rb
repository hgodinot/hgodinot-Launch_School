def divisors(n)
  result = []
  limit = Math.sqrt(n).to_i
  (1..limit).to_a.each do |candidate|
    if n % candidate == 0
      result << candidate
      result << (n/candidate)
    end
  end
  result.sort.uniq
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute