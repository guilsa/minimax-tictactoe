require_relative '../lib/tictactoe.rb'


module Helpers
  def initialize_with_two_computers
    @ai_x = ComputerPlayer.new("X", :min_max)
    @ai_o = ComputerPlayer.new("O", :random)
    @game = Tictactoe.new [@ai_x, @ai_o]
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
