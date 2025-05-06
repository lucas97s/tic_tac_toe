# This folder is to create the class for players.
# The class stores details about the players, stats, number of wins, etc.
class Player
  attr_reader :marker, :name

  def initialize(game, marker)
    @game = game
    @marker = marker
    puts "What is the name of player for #{marker} ? "
    @name = gets.chomp
  end

  def select_position!
    loop do
      @game.print_board
      puts "Player #{@name} to choose a position !"
      position = gets.chomp.to_i
      return position if @game.board[position].nil?

      puts "Invalid position, choose a position that is Empty"
    end
  end
end
