class OCR
  CONVERT = [" _ | ||_|", "     |  |", " _  _||_ ", " _  _| _|", "   |_|  |", 
  " _ |_  _|", " _ |_ |_|", " _   |  |", " _ |_||_|", " _ |_| _|"]

  def initialize(text)
    @arr = text.split("\n\n").map do |line|
      line.split("\n").map { |row| fill_in(row) }.map { |x| x.scan(/.../) }
    end
  end

  def fill_in(row)
    return row if row.size % 3 == 0 && row.size != 0
    row + " " * (3 - row.size % 3)
  end

  def convert
    @arr.map do |l|
      l[0].zip(l[1]).zip(l[2]).flatten.join.scan(/.{9}/).map do |num| 
        (CONVERT.index(num) || "?").to_s
      end.join
    end.join(",")
  end
end

# Other way to do it:

class OCR
  CONVERSION = [" _ \n| |\n|_|\n", "   \n  |\n  |\n", " _ \n _|\n|_ \n", 
  " _ \n _|\n _|\n", "   \n|_|\n  |\n", " _ \n|_ \n _|\n", " _ \n|_ \n|_|\n", 
  " _ \n  |\n  |\n", " _ \n|_|\n|_|\n", " _ \n|_|\n _|\n"]
  
  def initialize(str)
    @str = str
  end
  
  def convert
    @str.split("\n\n").map do |line|
      organize_string(line).map do |num|
        (CONVERSION.index(num) || "?").to_s
      end.join
    end.join(",")
  end
  
  private
  
  def organize_string(line)
    line.split("\n").map do |str|
      str << " " until str.size != 0 && str.size % 3 == 0
      str
    end.map { |str| str.scan(/.{3}/) }
       .transpose
       .map { |arr| arr.join("\n") << "\n" }
  end
end
=end

