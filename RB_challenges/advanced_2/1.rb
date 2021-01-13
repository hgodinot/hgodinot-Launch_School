class Garden
  STUDENTS = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph 
  Kincaid Larry)
  LET_TO_PLANT = { "C" => :clover, "G" => :grass, "R" => :radishes, "V" => :violets }
  
  def initialize(str, students = STUDENTS)
    @plants = str.split.map { |x| x.scan(/.{2}/) }
    @students = students.sort
    create_students_methods
  end
  
  def create_students_methods
    @students.each do |name|
      define_singleton_method("#{name.downcase}") do | |
        find_plants(@students.index(name.capitalize))
      end
    end
  end
  
  def find_plants(idx)
    @plants.map { |row| row[idx].chars }.flatten.map { |chr| LET_TO_PLANT[chr] }
  end
end

