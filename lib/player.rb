require 'forwardable'

module Player
  def play board, position
    @board = board
    @board.state[position] = @mark if @board.valid_position?(position)
  end
end

module TictactoePlayer
  attr_accessor :mark
end

class Human

  include Player
  include TictactoePlayer

  def initialize mark
    self.mark =  mark
  end

  def next_move board
    puts "Your turn. Numbers represent locations:"
    board.display
    puts "Invalid input. Try again!" until valid_input? board
    @user_input
  end

  def name
    "Guil"
  end

  private

  def valid_input? board
    @user_input = gets.chomp.to_i - 1
    return false if @user_input == -1
    board.valid_position? @user_input
  end

end

class Computer
  extend Forwardable
  include Player
  include TictactoePlayer

  def initialize mark, game_strategy
    self.mark =  mark
    @game_strategy = game_strategy
  end

  # Strategy pattern (Design Patterns in Ruby)
  # with delegation + forwardable (http://brainspec.com/blog/2012/11/07/delegation-with-forwardable/)
  def_delegators :@game_strategy, :next_move, :name
  # Above is the same as:
  # def next_move board
  #   @game_strategy.next_move board
  # end
  # Also is the same as:
  # def next_move *args, &block
  #   @game_strategy.next_move(*args, &block)
  # end
end

# Had no trouble testing this as a class
# Now I need to change it to a module and am wondering how to "initialize" it.
module AI
  def next_move game
    a = minmax game, game.player
    puts "Max plays: " if __FILE__ == $0
    binding.pry
  end

  def score game
    if game.winner == game.computer
      return 1
    elsif game.winner == game.human
      return -1
    else
      return 0
    end
  end

  def minmax game, players, move=nil

    cloned_players = players.dup
    return score game if game.over?
    scores = []
    moves = []

    game.board.get_available_positions do |next_move|
      possible_game = game.get_new_state(next_move, cloned_players[0])
      cloned_players.rotate!
      score << minmax(possible_game, cloned_players, next_move)
    end

    binding.pry
  end

end

class Min
  def next_move board
    play = board.get_available_positions.sample
    puts "Min plays: #{play + 1}" if __FILE__ == $0
    play
  end

  def name
    "Minual"
  end
end

# I know composition over inheritance
# But I can unit test my AI class.
# If it's a module, do I create an instance of x then extend module?

class Max
  # def next_move board
  #   play = board.get_available_positions.sample
  #   puts "Max plays: #{play + 1}" if __FILE__ == $0
  #   play
  # end

  def name
    "Maximillian"
  end
end
