require_relative 'player'

class Human

  include Player

  def initialize mark
    self.mark =  mark
  end

  def next_move game
    puts "Your turn. Numbers represent locations:"
    game.board.display
    puts "Invalid input. Try again!" until valid_input? game.board
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
