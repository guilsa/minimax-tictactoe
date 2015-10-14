require_relative 'player'

class HumanPlayer
  include Player

  def next_move game
    puts "Your turn (you are #{mark}). Numbers represent locations:"
    game.board.display

    position = nil
    while position.nil?
      position = input_position game.board
      if position.nil?
        puts "Invalid input. Try again!"
      else
        play board, position
      end
    end
  end

  def name
    "You"
  end

  private

  def input_position board
    user_input = gets.chomp.to_i
    board.valid_position?(user_input) ? user_input : nil
  end
end
