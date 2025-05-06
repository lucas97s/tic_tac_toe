# Pseudo code has to be written prior to writing. What is the work process ?

require "pry-byebug"

require_relative "lib/player"
require_relative "lib/board"
require_relative "lib/game"

Game.new(Player, Player).play
