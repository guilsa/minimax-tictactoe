require_relative '../lib/tictactoe.rb'


module Helpers
  def initialize_with_two_computers
    @ai_X = ComputerPlayer.new("X", :min_max)
    @ai_O = ComputerPlayer.new("O", :min_max)
    @game = Tictactoe.new [@ai_X, @ai_O]
  end

  def initialize_human_vs_computer
    @computer = ComputerPlayer.new("X", :min_max)
    @human = HumanPlayer.new("O")
    @game = Tictactoe.new [@computer, @human]
  end

  def play_until_winner
    while @game.winner.nil?
      initialize_with_two_computers
      @game.play_the_game
    end
  end
end

RSpec.configure do |c|
  c.include Helpers
end
