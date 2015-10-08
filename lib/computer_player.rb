require_relative 'player'
require_relative './ai/ai'

class Computer
  extend Forwardable
  include Player


  def initialize mark, game_strategy
    self.mark =  mark
    @game_strategy = game_strategy
  end

  def_delegators :@game_strategy, :next_move, :name
end


class Min
  def next_move game
    play = game.board.get_available_positions.sample
    puts "Min plays: #{play + 1}" if __FILE__ == $0
    play
  end

  def name
    "Minual"
  end
end

class Max
  include AI
  # def next_move game
  #   play = game.board.get_available_positions.sample
  #   puts "Max plays: #{play + 1}" if __FILE__ == $0
  #   play
  # end

  def name
    "Maximillian"
  end
end
