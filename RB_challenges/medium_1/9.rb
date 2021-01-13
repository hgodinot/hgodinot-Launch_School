class Clock
  def self.at(h, m = 0)
    Clock.new(h, m)
  end
  
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end
  
  def to_s
    format("%02d:%02d", @hour, @minute)
  end
  
  def +(added_m)
    added_h, @minute = (@minute + added_m).divmod(60)
    @hour = (@hour + added_h) % 24
    self
  end
  
  def -(sub_m)
    self + (-sub_m)
  end
  
  def ==(other_clock)
    self.to_s == other_clock.to_s
  end
end
