=begin
  DndCharacter is a class that randomly determines a new DnD characters stats and hitpoints
  The class initializes by rolling for all stats and contains accessors for all ability scores
=end
class DndCharacter
  # Creates accessors for all stats
  attr_accessor :hitpoints
  attr_accessor :strength
  attr_accessor :dexterity
  attr_accessor :constitution
  attr_accessor :intelligence
  attr_accessor :wisdom
  attr_accessor :charisma

  # Calculates stat modifiers using the formula:
  # (Score - 10) / 2 rounded down
  def self.modifier(val)
    return ((val - 10) / 2).round(half: :down)
  end

  # Rolls an ability score using the roll 4, keep highest 3 method
  def roll_stat
    dice = []
    # Add 4 dice to the array
    for i in 0..3
      dice.append(Random.rand(1..6))
    end
    # Sort and add the 3 highest values
    return dice.sort[1,3].sum
  end

  def initialize
    @strength = roll_stat
    @dexterity = roll_stat
    @constitution = roll_stat
    @intelligence = roll_stat
    @wisdom = roll_stat
    @charisma = roll_stat
    @hitpoints = 10 + DndCharacter.modifier(@constitution)
    puts @hitpoints
  end
end
