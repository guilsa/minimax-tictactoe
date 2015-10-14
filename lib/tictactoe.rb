require 'pry'

require_relative 'board'
require_relative 'game'
require_relative 'human_player'
require_relative 'computer_player'

################################################
class Tictactoe < Game
  # Grid is:
  # 1 2 3
  # 4 5 6
  # 7 8 9

  WINNING_LINES = [
    [1, 4, 7], [2, 5, 8], [3, 5, 9], # Vertical lines
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # Horizontal lines
    [1, 5, 9], [3, 5, 7] # Diagonals.
  ]

  def initialize players, board=nil
    board ||= Board.new
    super board, players
  end

  def winner
    WINNING_LINES.each do |winning_line|
      @players.each do |player|
        return player if winning_line.all? { |position| @board[position] == player.mark }
      end
    end

    nil
  end

  def draw?
    @board.full? && winner.nil?
  end

  def new_game position
    board = @board.new_board position, current_player.mark
    self.class.new @players.rotate, board
  end
end
