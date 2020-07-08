class School
  def initialize
    @roster = {}
  end
  
  def to_h
    temp_array = roster.sort
    result = {}
    temp_array.each { |pair| result[pair[0]] = [] }
    temp_array.each do |pair|
      pair[1].sort.each { |name| result[pair[0]] << name }
    end
    result
  end
  
  def grade(grd)
    #roster[grd] || []
    roster.has_key?(grd) ? roster[grd] : []
  end
  
  def add(student, grade)
    roster.has_key?(grade) ? roster[grade] << student : roster[grade] = [student]
  end
  
  protected
  attr_accessor :roster
end


