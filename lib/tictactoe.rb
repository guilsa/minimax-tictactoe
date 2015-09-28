require 'board'
require 'player'
require 'pry'

module Rules
  WIN_POS = [[0, 3, 6], [1, 4, 7], [2, 5, 8],
             [0, 1, 2], [3, 4, 5], [6, 7, 8],
             [0, 4, 8], [2, 4, 6]]

  def winner? board
    winners_pos = []
    WIN_POS.each do |combination|
      combination.each { |position| winners_pos << board.state[position] }
      return true if winners_pos.all? { |i| i == "x" } || winners_pos.all? { |i| i == "o" }
      winners_pos = []
    end
    return false
  end

  def draw? board
    return board.state.include?(" ") ? false : true
  end

  def take_turns players
    players.rotate!
  end

end

class Tictactoe
  include Rules

  attr_reader :count

  def initialize
    @board = Board.new
    @ai_max = ComputerMax.new("x")
    @ai_min = ComputerMin.new("o")
    @players = [@ai_max, @ai_min]
  end

  def play_the_game
    until game_over?
      player.play @board, player.decide_position
      take_turns @players
    end
  end

  def game_over?
    return winner?(@board) || draw?(@board) ? true : false
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

  private

  def player
    @players[0]
  end

end
