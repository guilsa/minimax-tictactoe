require_relative 'board'
require_relative 'player'
require 'pry'

class Game
  attr_accessor :board, :players

# Instance variables get initialized here via dependency inversion
  def play_the_game board, players
    @board = board
    @players = players
    until game_over?
      player.play board, player.next_move(@board)
      take_turns @players
    end
  end

  def game_over?
    !!winner || draw?
  end

  def take_turns players
    @players.rotate!
  end

  def player
    @players[0]
  end

  def get_new_state(position)
    game = self.class.new
    game.board = game.board.get_new_state(posititon, player.mark)
    game.players = @players.dup.rotate
    game
  end
end

class Tictactoe < Game

  WIN_POS = [[0, 3, 6], [1, 4, 7], [2, 5, 8],
             [0, 1, 2], [3, 4, 5], [6, 7, 8],
             [0, 4, 8], [2, 4, 6]]

  def winner
    saved_positions = []
    WIN_POS.each do |some|
      some.each { |position| saved_positions << @board.state[position] }

      @players.each do |player|
        return player if saved_positions.all? { |i| i == player.mark }
      end
      saved_positions.clear
    end
    return nil
  end

  def draw?
    !@board.state.include?(" ")
  end

end

# $0 represents name of file that is being run from terminal
# For rspec, $0 would be something like rspec.rb

if __FILE__ == $0
  game = Tictactoe.new
  board = Board.new
  computer = Computer.new("X", Max.new)
  human = Human.new("O")
  players = [computer, human]
  game.play_the_game board, players
  board.display
  winner = game.winner
  if winner
    puts "Winner: #{winner.name} as #{winner.mark}."
  else
    puts "No winner this time. Try again!"
  end
end
