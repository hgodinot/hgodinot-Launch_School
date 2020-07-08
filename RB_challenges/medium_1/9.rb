class Clock
  attr_accessor :hour, :minute
  
  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end
  
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end
  
  def +(other)
    h, m = other.divmod(60)
    h += 1 if m + minute >= 60
    self.hour = (hour + h) % (24)
    self.minute = (minute + m) % (60)
    self
  end
  
  def -(other)
    h, m = other.divmod(60)
    h += 1 if minute - m < 0
    self.hour = (hour - h) % (24)
    self.minute = (minute - m).abs
    self
  end
  
  def to_s
    format('%02d:%02d', hour, minute)
  end
  
  def ==(other)
    hour == other.hour && minute == other.minute
  end
end
