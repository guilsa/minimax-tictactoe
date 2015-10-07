require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/tictactoe.rb'

module Helpers
  def set_game_up
    @board = Board.new
    @ai_max = Computer.new("X", Max.new)
    @ai_min = Computer.new("O", Min.new)
    @players = [@ai_max, @ai_min]
    @game = Tictactoe.new(@board, @players)
  end
end
