# This class looks at the Game

LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]] # rubocop:disable Style/MutableConstant

class Game
  attr_reader :board

  def initialize(player_1, player_2)
    @board = Array.new(10)
    @players = [player_1.new(self, "O"), player_2.new(self, "X")]
    @current_player_id = 0
    puts "#{current_player.name} goes first !"
  end

  def play
    loop do
      place_player_marker(current_player)

      if player_won?(current_player)
        puts "#{current_player.name} has won !"
        print_board
        return
      elsif board_full?
        puts "The game has ended in a draw"
        print_board
        return
      end
      switch_player!
    end
  end

  def place_player_marker(player)
    position = player.select_position!
    puts "Player #{player.name} has placed #{player.marker} in position #{position} !"
    @board[position] = player.marker
  end

  def current_player
    @players[@current_player_id]
  end

  def other_player_id
    1 - @current_player_id
  end

  def other_player
    @players[other_player_id]
  end

  def switch_player!
    @current_player_id = other_player_id
  end

  def free_positions
    (1..9).select { |position| @board[position].nil? }
  end

  def board_full?
    free_positions.empty?
  end

  def player_won?(player)
    LINES.any? do |line|
      line.all? { |position| @board[position] == player.marker }
    end
  end

  def print_board
    col_seperator = " | "
    row_seperator = "--+---+--"
    label_for_positions = ->(position) { @board[position] || position }
    row_for_display = ->(row) { row.map(&label_for_positions).join(col_seperator) }
    row_positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    rows_for_display = row_positions.map(&row_for_display)
    puts rows_for_display.join("\n" + row_seperator + "\n")
  end
end
