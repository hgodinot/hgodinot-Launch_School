class WordProblem
  OPERATIONS = { "plus" => :+, "minus" => :-, "multiplied" => :*, "divided" => :/ }
  
  def initialize(problem)
    @numbers = problem.scan(/-?\d+/).map(&:to_i)
    @operators = problem.scan(/plus|minus|multiplied|divided/)
  end
  
  require "pry"
  
  def answer
    binding.pry
    raise ArgumentError if @numbers.size < 2 || @operators.size != @numbers.size - 1
    @numbers.reduce { |result, num| result.send(OPERATIONS[@operators.shift], num) }
  end
end

problem = 'What is 2 multiplied by -2 multiplied by 3 minus 2'
WordProblem.new(problem).answer