class Game
  attr_reader :game_over

  def initialize
    @frames = []
  end
  
  def roll(pins)
    raise StandardError, 'Should not be able to roll after game is over' if game_over
    @frames.empty? ? new_frame(pins) : actualize_frames(pins)
    game_over?
  end
  
  def new_frame(pins)
    @frames << Frame.new(pins)
  end
  
  def actualize_frames(pins)
    @frames.last.over ? new_frame(pins) : @frames.last.actualize(pins)
  end
  
  def game_over?
    @game_over = true if @frames.size == 10 && @frames.last.open_frame || #10 frames game, no last strike or frame
    @frames.size == 11 && !@frames.last.strike && @frames.last.over || #10th frame is a strike but not 11th
    @frames.size == 11 && @frames[-2].frame || #10th frame is a frame
    @frames.size == 12 #Perfect game
  end
  
  def score
    check_score_error
    @frames[0, 10].map.with_index do|frm, idx|
      score = frm.pins.sum
      if frm.strike
        if @frames[idx + 1].strike
          score += 10 + @frames[idx + 2].pins.first
        else
          score += @frames[idx + 1].pins.sum
        end
      elsif frm.frame
        score += @frames[idx + 1].pins.first
      end
      score
    end.sum
  end
  
  def check_score_error
    raise StandardError, 'Score cannot be taken until the end of the game' if @frames.empty?
    raise StandardError, 'Game is not yet over, cannot score!' unless game_over
  end 
end

class Frame
  attr_reader :strike, :frame, :open_frame, :over, :pins
  
  def initialize(pins)
    check_pins_error(pins)
    @pins = [pins]
    update_frame_status
  end
  
  def actualize(pins)
    check_pins_error(pins)
    @pins << pins
    update_frame_status
  end
  
  def update_frame_status
    @strike = true if @pins == [10]
    @frame = true if !@strike && @pins.sum == 10
    @open_frame = true if !@frame && @pins.size == 2
    @over = true if @strike || @frame || @open_frame
  end
  
  def check_pins_error(points)
    raise StandardError,'Pins must have a value from 0 to 10' if ![*0..10].include?(points)
    raise StandardError, 'Pin count exceeds pins on the lane' if @pins && @pins.sum + points > 10
  end
end


# Another longer way to do it (first run)

class Game
  def initialize
    clean_rolls
    @frames = []
  end

  def roll(n)
    check_scoring_error(n)
    @rolls << n
    update_frames_and_rolls
  end

  def score
    reveal_score?
    @frames.map.with_index { |frame, idx| calculate_score(frame, idx) }.sum
  end

  private

  def update_frames_and_rolls
    case evaluate_rolls
    when :strike then @frames << Frame.new(roll1: 10)
    when :two_over then @frames << Frame.new(roll1: @rolls[0], roll2: @rolls[1])
    when :one_over then @frames << Frame.new(roll1: @rolls[0])
    end
    clean_rolls if evaluate_rolls
  end

  def evaluate_rolls
    if @rolls.first == 10
      :strike
    elsif @rolls.size == 2
      :two_over
    elsif @frames.size == 10 && @frames.last.spare
      :one_over
    end
  end

  def clean_rolls
    @rolls = []
  end

  def check_scoring_error(n)
    raise StandardError.new, 'Pins must have a value from 0 to 10' if \
    !(0..10).include?(n)
    raise StandardError, 'Pin count exceeds pins on the lane' if \
    n + @rolls.sum > 10
    raise StandardError, 'Should not be able to roll after game is over' if \
    game_over?
  end

  def reveal_score?
    raise StandardError.new 'Game is not yet over, cannot score!' if \
    !game_over? && eleven_frame?
    raise StandardError.new 'Score cannot be taken until the end of the game' \
    if !game_over?
  end

  def game_over?
    @frames.size == 12 || # At least 11 strikes
      @frames.size == 11 && !@frames.last.roll2.nil? || # Strike at 10th frame
      @frames.size == 11 && @frames[9].spare || # Spare at 10th frame
      @frames.size == 10 && !eleven_frame? # No strike or spare on 10th frame
  end

  def eleven_frame?
    @frames.size >= 10 && (@frames[9].strike || @frames[9].spare)
  end

  def calculate_score(frame, idx)
    raise ArgumentError.new 'Argument must be a Frame object' if \
    frame.class != Frame
    return 0 if idx > 9
    frame_score(frame, idx)
  end

  def frame_score(frame, idx)
    if frame.strike && @frames[idx + 1].strike
      20 + @frames[idx + 2].roll1
    elsif frame.strike
      10 + @frames[idx + 1].score
    elsif frame.spare
      10 + @frames[idx + 1].roll1
    else
      frame.score
    end
  end
end

class Frame
  attr_reader :strike, :spare, :roll1, :roll2

  def initialize(roll1:, roll2: nil)
    @strike = roll1 == 10
    @spare = roll2 && roll1 + roll2 == 10 ? true : false
    @roll1 = roll1
    @roll2 = roll2
  end

  def score
    roll1 + roll2
  end
end
