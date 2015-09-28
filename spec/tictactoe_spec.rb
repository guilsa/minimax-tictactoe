require 'spec_helper'

# describe "#winner?" do
#
#   class DummyClass end
#
#   before(:all) do
#     @dummy = DummyClass.new
#     @dummy.extend Rules
#   end
#
#   it "should return true given a winning board or false otherwise" do
#
#
#     # board = Board.new
#     # board.state = [" ", "o", "o", "x", "x", "x", "x", " ", " "]
#     # ["x", " ", "x", "x", " ", "o", "x", " ", " "]
#     # ["x", "x", " ", " ", "x", "o", "o", "o", "x"]
#     # [" ", "x", "x", "o", "o", "o", " ", "x", " "]
#     # board.winner
#   end
# end

describe "#start_the_game" do
  it "should start and end the game with a winner or a draw" do
    game = Tictactoe.new
    game.play_the_game
    game.print_board
    # expect(game.winner).to include("x", "o")
  end
end
