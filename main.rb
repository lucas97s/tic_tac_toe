# Pseudo code has to be written prior to writing. What is the work process ?

require "pry-byebug"

require_relative "lib/player"
require_relative "lib/board"

puts "What is player Number 1's name ?"
player_num1 = gets.chomp
puts "What is player Number 2's name ?"
player_num2 = gets.chomp
players = [Player.new(player_num1, 0, false, 1), Player.new(player_num2, 0, false, 2)]
board_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]

playing_board = Board.new(board_positions, "O")

# one loop of the game
winner_found = false
track_player_turn = 0
playing_board.display_board

until winner_found

  if track_player_turn.even?
    players[0].player_turn = true
    players[1].player_turn = false
    players[0].player_turn_message
    playing_board.current_play_x_or_o = "O"
    playing_board.user_inputs
  elsif track_player_turn.odd?
    players[0].player_turn = true
    players[1].player_turn = false
    players[1].player_turn_message
    playing_board.current_play_x_or_o = "X"
    playing_board.user_inputs
  end

  track_player_turn += 1
  winner_found = playing_board.check_for_wins

  if track_player_turn == 9 && !winner_found
    puts "The game is a draw"
    playing_board.display_board
    break
  elsif winner_found
    players[0].score = 1 if players[0].player_turn
    players[0].score = 1 if players[0].player_turn
    players[0].player_won_or_lost
    players[1].player_won_or_lost
    playing_board.display_board
    break
  end

  playing_board.display_board
end
