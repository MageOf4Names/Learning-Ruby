=begin
  Game is a class designed to take in a series of rolls representing a bowling game and, once it has
  detected the game is over, return the final score.
=end

class Game
  class BowlingError < StandardError
  end
  
  def initialize
    @score = 0  #Total game score
    @frame = 0  #Tracks the current frame of the game
    @strike1 = false  #Flag for the first additional score for a strike
    @strike2 = false  #Flag for the second additional score for a strike
    @spare = false  #Flag for extra points because of a spare
    @roll1 = -1  #Tracks the first roll in a frame
    @roll2 = -1  #Tracks the second roll in a frame
    @bonus = false  #Flag to indicate if the bonus rolls have happened yet
  end
    
  def roll(pins)
    # Check to see if a valid number of pins were knocked down.
    if pins < 0 or pins > 10
      raise BowlingError.new
    end
    # Cannot roll after 10 frames.
    if @frame > 10
      raise BowlingError.new
    end

    # Bonus scoring for strikes and spares
    # Adds the first roll of the new frame for a spare
    if @spare
      @score += pins
      @spare = false
      # Reset spare flag if there is a strike in the bonus roll
      if @frame == 10 and pins == 10
        @spare = true
      end
    end
    # Adds the second bonus score for a strike and removes the strike flag
    if @strike2
      @score += pins
      @strike2 = false
    end
    # Adds the first bonus score for a strike and moves the flag
    if @strike1
      @score += pins
      @strike1, @strike2 = false, true
    end
    # Add pins as long as it isn't a bonus frame.
    if @frame <= 9
      @score += pins
    # Remove scoring for bonus frames in the case of double strikes
    elsif @bonus
      @score -= pins
    end

    # Checks to see if the first ball for the frame has been rolled
    if @roll1 < 0
      @roll1 = pins
      # If the first roll is a strike, then set strike flags
      if pins == 10
        if !(@frame == 10 and @spare)
          @strike1 = true
        end
        @roll2 = 0
      end
    else
      @roll2 = pins
      # Check for a spare
      if @roll1 + @roll2 == 10
        @spare = true
      # Raise an error if more than 10 pins were scored in a frame.
      elsif @roll1 + @roll2 > 10
        raise BowlingError.new
      end
    end
    # Resets the frame if both rolls have been counted
    if @roll1 >= 0 and @roll2 >= 0
      @roll1, @roll2 = -1, -1
      @frame += 1
    end
    # Checks to see if the bonus frame is open
    if @frame == 10 and !(@spare or @strike1 or @strike2)
      @frame += 1
    # Checks to see if the bonus frame has 2 strikes
    elsif @frame == 11 and @strike1 and !@bonus
      @frame -= 1
      @bonus = true
    end
  end

  def score
    # Checks to see if bonus rolls still need to be scored.
    if @frame == 10 and (@spare or @strike1)
      raise BowlingError.new(@spare)
    # Checks to see if there are too few or too many frames rolled
    elsif @frame < 9
      raise BowlingError.new(@frame.to_i)
    # Otherwise, returns the score if the game is finished
    else
      @score
    end
  end
end