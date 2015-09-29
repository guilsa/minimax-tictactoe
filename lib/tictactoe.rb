require 'board'
require 'player'
require 'pry'

class Game
  def play_the_game board, players
    @board = board
    @players = players
    until game_over?
      player.play board, player.get_position
      take_turns @players
    end
  end

  def game_over?
    return winner?(@board) || draw?(@board) ? true : false
  end

  private

  def take_turns players
    @players.rotate!
  end

  def player
    @players[0]
  end
end

class Tictactoe < Game

  WIN_POS = [[0, 3, 6], [1, 4, 7], [2, 5, 8],
             [0, 1, 2], [3, 4, 5], [6, 7, 8],
             [0, 4, 8], [2, 4, 6]]

  def winner? board
    saved_positions = []
    WIN_POS.each do |some|
      some.each { |position| saved_positions << board.state[position] }
      return true if saved_positions.all? { |i| i == "x" } || saved_positions.all? { |i| i == "o" }
      saved_positions = []
    end
    return false
  end

  def draw? board
    return board.state.include?(" ") ? false : true
  end

  def print_board
    puts ""
    puts " #{@board.state[0]} | #{@board.state[1]} | #{@board.state[2]}  "
    puts "---+---+---"
    puts " #{@board.state[3]} | #{@board.state[4]} | #{@board.state[5]}  "
    puts "---+---+---"
    puts " #{@board.state[6]} | #{@board.state[7]} | #{@board.state[8]}  "
    puts ""
  end

end
