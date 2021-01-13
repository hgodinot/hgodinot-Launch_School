class Robot
  DIR = [:north, :east, :south, :west]
  attr_reader :coordinates, :bearing
  
  def orient(dir)
    raise ArgumentError unless DIR.include?(dir)
    @bearing = dir
  end
  
  def turn_right
    redirect(:+)
  end
  
  def turn_left
    redirect(:-)
  end
  
  def redirect(ope)
    @bearing = DIR[ DIR.index(@bearing).send(ope, 1) % 4]
  end
  
  def at(x, y)
    @coordinates = [x, y]
  end
  
  def advance
    @coordinates[0] += 1 if @bearing == :east
    @coordinates[0] -= 1 if @bearing == :west
    @coordinates[1] += 1 if @bearing == :north
    @coordinates[1] -= 1 if @bearing == :south
  end
end

class Simulator
  CONVERSION = { "A" => :advance, "R" => :turn_right, "L" => :turn_left }
  
  def instructions(str)
    raise ArgumentError if str.match(/[^ARL]/) # Not part of the test
    str.chars.map { |chr| CONVERSION[chr] }
  end
  
  def evaluate(bot, str)
    instructions(str).each { |instr| bot.send(instr) }
  end
  
  def place(bot, x:, y:, direction: )
    bot.at(x, y)
    bot.orient(direction)
  end
end