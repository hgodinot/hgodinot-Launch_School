class School
  def initialize
    @hsh = Hash.new
  end
  
  def to_h
    @hsh.sort.to_h
  end
  
  def add(name, grade)
    @hsh[grade].nil? ? @hsh[grade] = [name] : (@hsh[grade] << name).sort!
  end
  
  def grade(grd)
    @hsh[grd] || []
  end
end

# other way:

class School
  attr_reader :hash
  
  def initialize
    @hash = Hash.new { |hash, grade| hash[grade] = [] }
  end
  
  def to_h
   hash.sort.each { |grade, name| name.sort! }.to_h
  end
  
  def add(name, grade)
    hash[grade] << name
  end
  
  def grade(n)
    @hash[n]
  end
end