class WordProblem
  OPERATIONS = { "plus" => :+, "minus" => :-, "multiplied" => :*, "divided" => :/ }
  
  def initialize(problem)
    @numbers = problem.scan(/-?\d+/).map(&:to_i)
    @operators = problem.scan(/plus|minus|multiplied|divided/)
  end
  
  def answer
    raise ArgumentError if @numbers.size < 2 || @operators.size != @numbers.size - 1
    @numbers.reduce { |result, num| result.send(OPERATIONS[@operators.shift], num) }
  end
end
