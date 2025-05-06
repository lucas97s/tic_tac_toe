# This folder is to create the class for players.
# The class stores details about the players, stats, number of wins, etc.
class Player
  attr_accessor :name, :score, :player_turn, :pos

  def initialize(name, score, player_turn, pos)
    @name = name
    @score = score
    @player_turn = player_turn
    @pos = pos
  end

  def player_won_or_lost
    if score == 1
      puts "Player #{name} has won the game!"
    else
      puts "Player #{name} has lost the game!"
    end
  end

  def player_turn_message
    puts "Player #{name}'s turn, please select a position to play!"
  end
end
