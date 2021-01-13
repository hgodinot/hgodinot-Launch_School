class Robot
  NAME_POSSIBILITIES = 676_000 # 26 * 26 * 10 * 10 * 10 letters & numbers combinations
  attr_reader :name
  
  @@former_names = []
  
  def initialize
    reset
  end
  
  def reset
    loop do
      @name = [*'AA'..'ZZ'].sample.concat([*'000'..'999'].sample)
      break if !@@former_names.include?(name) || @@former_names.size == NAME_POSSIBILITIES
    end
    @@former_names << @name unless @@former_names.size == NAME_POSSIBILITIES
  end
end
