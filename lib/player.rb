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

# Not complete yet, ended up getting into a messy rabbit hole
class AI
  def next_move game

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

  def minmax game, player, move
    return [move, game.winner] if game.game_over?
    winners_by_move = []

    game.board.get_available_positions do |next_move|
      possible_game = game.get_new_state(next_move, player)
      winners_by_move << ([move] + next_move(possible_game, player, next_move))
    end

    winners_by_move.each do |x|
      return [x[0], player] if x[2] == player
    end

    winners_by_move.each do |x|
      return [x[0], nil] if x[2].nil?
    end

    return [winners_by_move[0][0], (game.players - [player])[0]]
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

class Max
  def next_move board
    play = board.get_available_positions.sample
    puts "Max plays: #{play + 1}" if __FILE__ == $0
    play
  end

  def name
    "Maximillian"
  end
end
