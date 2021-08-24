class Warrior
  
  VALID_LEVELS = (1..100)
  RANKS = ["Pushover", "Novice", "Fighter", "Warrior", "Veteran", "Sage"] + 
  ["Elite", "Conqueror", "Champion", "Master", "Greatest"]
  
  attr_accessor :level, :experience, :rank, :achievements, :defeated, :valid_fight,
                :fight_result
  
  def initialize
    @level = 1
    @experience = 100
    @rank = "Pushover"
    @achievements = []
    @defeated = false
    @valid_fight = true
    @fight_result = nil
  end
  
  def battle(lvl)
    clean_states
    check_validity(lvl)
    defeated?(lvl)
    determine_result(lvl)
    increase_xp(calculate_xp(lvl))
    display_result
  end
  
  def clean_states
    self.defeated = false
    self.valid_fight = true
    self.fight_result = nil
  end
  
  def check_validity(lvl)
     if !VALID_LEVELS.include? (lvl)
       self.valid_fight = false
     end
  end
  
  def defeated?(lvl)
    if valid_fight && (lvl/10) > (level/10) && lvl >= (level + 5)
      self.defeated = true
    end
  end
  
  def determine_result(lvl)
    if !valid_fight
      self.fight_result = "Invalid level" 
    elsif defeated
      self.fight_result = "You've been defeated"
    elsif level >= (lvl + 2)
      self.fight_result = "Easy fight"
    elsif level >= (lvl)
      self.fight_result = "A good fight"
    else
      self.fight_result = "An intense fight"
    end
  end
  
  def calculate_xp(lvl)
    return 0 if !valid_fight || defeated || lvl <= (level - 2)
    return 10 if lvl == level
    return 5 if lvl == level - 1
    20 * (lvl - level)**2
  end
  
  def increase_xp(xp)
    return if xp == 0 || level == 100
    self.experience += xp
    self.experience = 10000 if experience > 10000
    update_level
  end
  
  def update_level
    old_level = level
    self.level = experience/100
    update_rank if level != old_level
  end
  
  def update_rank
    self.rank = RANKS[level/10]
  end
  
  def display_result
    fight_result
  end
  
  def training(program)
    return "Not strong enough" if program.last > level
    increase_xp(program[1])
    achievements << program[0]
    program[0]
  end
end

bruce_lee = Warrior.new

p bruce_lee.level         # => 1
p bruce_lee.experience    # => 100
p bruce_lee.rank          # => "Pushover"
p bruce_lee.achievements  # => []
p bruce_lee.training(["Defeated Chuck Norris", 9000, 1]) # => "Defeated Chuck Norris"
p bruce_lee.experience    # => 9100
p bruce_lee.level         # => 91
p bruce_lee.rank          # => "Master"
p bruce_lee.battle(90)    # => "A good fight"
p bruce_lee.experience    # => 9105
p bruce_lee.achievements  # => ["Defeated Chuck Norris"]