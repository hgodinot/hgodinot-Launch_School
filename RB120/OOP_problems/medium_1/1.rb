class Machine
  
  
  def initialize
    @switch = :off
  end
  
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end
  
  def display_switch
    switch
  end
  
  private
  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
  
end

ex = Machine.new
ex.start
p ex
ex.stop
p ex
p ex.display_switch
