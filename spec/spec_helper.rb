require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/tictactoe.rb'

module Helpers
  def initialize_with_two_computers
    @board = Board.new
    @ai_max = Computer.new("X", Max.new)
    @ai_min = Computer.new("O", Min.new)
    @players = [@ai_max, @ai_min]
    @game = Tictactoe.new(@board, @players)
  end

  def initialize_human_vs_computer
    @board = Board.new
    @computer = Computer.new("X", Max.new)
    @human = Human.new("O")
    @players = [@computer, @human]
    @game = Tictactoe.new(@board, @players)
  end

  def play_until_winner
    until @game.winner != nil
      initialize_with_two_computers
      @game.play_the_game
    end
  end
end

RSpec.configure do |c|
  c.include Helpers
end
