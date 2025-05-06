# This will host the class for the board
class Board
  attr_accessor :positions, :current_play_x_or_o

  def initialize(positions, current_play_x_or_o)
    @positions = positions
    @current_play_x_or_o = current_play_x_or_o
  end

  def display_board
    puts "#{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts "#{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts "#{positions[6]} | #{positions[7]} | #{positions[8]}"
  end

  def user_inputs
    int_to_correct_array_pos = 1
    pos = gets.chomp.to_i - int_to_correct_array_pos
    positions[pos] = current_play_x_or_o
  end

  def check_for_wins
    # Check Rows
    row1 = positions[0] == positions[1] && positions[1] == positions[2]
    row2 = positions[3] == positions[4] && positions[4] == positions[5]
    row3 = positions[6] == positions[7] && positions[7] == positions[8]

    # Check Columns
    column1 = positions[0] == positions[3] && positions[3] == positions[6]
    column2 = positions[1] == positions[4] && positions[4] == positions[7]
    column3 = positions[2] == positions[5] && positions[5] == positions[8]

    # Checks Diagnols
    diagonal1 = positions[0] == positions[4] && positions[4] == positions[8]
    diagonal2 = positions[2] == positions[4] && positions[4] == positions[6]

    if row1 || row2 || row3 || column1 || column2 || column3 || diagonal1 || diagonal2
      true
    else
      false
    end
  end
end
