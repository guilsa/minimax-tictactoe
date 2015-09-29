# Why use inheritance when I should prefer composition?
# No plan of having anything else as a base class. It's a learning experience.

module Minmax

  def score

  end

  # Should I pass the Board object or board_state (the array object)?
  def minmax board, game
    @board = board.state
    @game = game
    return score game_state if game.game_over?
    scores = []
    moves = []

    get_available_positions do |position|
      # Just play correctly, don't care who's turn it is from this perspective.
      # Thing is, I designed Game to play from beginning to end in one call.
      # Here it seems like we need to play once and save state so that we can play again later
      # New requirement: There needs to be a Game method to allow for one play given Game state
      possible_game = get_new_state(@board.state)
      scores << minmax(possible_game, @game)
    end

  end

  private

  def get_available_positions
    available_positions = []
    @board.each_with_index { |mark, index| available_positions << index if mark == " " }
    return available_positions
  end

end

class Player

  def play board, position
    @board = board
    @board.state[position] = @mark if @board.valid_position?(position)
  end

  def get_position
  end

end

module TicTacToePlayer
  attr_accessor :mark
end

class Human
  include TicTacToePlayer

  def initialize mark
    self.mark =  mark
  end

  def get_position
  end

end

class Computer < Player
  include TicTacToePlayer
  attr_accessor :game_strategy

  def initialize mark, game_strategy
    self.mark =  mark
    @game_strategy = game_strategy
  end

  def get_position
    @game_strategy.get_position
  end

end

class Min
  def get_position
    # Player might not play because it'll only try once and move on to the next player.
    # Bad way to mock the minmax behavior.
    # Ultimately that was my object though. Mock it so I can understand it.
    play = Random.rand(9)
    puts "Min plays: #{play}"
    play
  end
end

class Max
  def get_position
    play = Random.rand(9)
    puts "Max plays: #{play}"
    play
  end
end

# IO Class for terminal/web input so that Human can get_position
# class IO
#   def get_position
#   end
# end
