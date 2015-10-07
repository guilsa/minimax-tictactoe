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
  xit "should start and end the game with a winner or a draw" do
    game = Tictactoe.new
    board = Board.new
    ai_max = Computer.new("X", Max.new)
    ai_min = Computer.new("O", Min.new)
    players = [ai_max, ai_min]
    game.play_the_game board, players
    expect(game.winner.mark).to include("X", "O")
  end
end

describe "#winner" do
  xit "should know who won or if there's currently no winner" do
  end
end

describe "#draw?" do
  xit "should know if the board is filled up" do
  end
end

describe "#take_turns" do
  xit "should should rotate players" do
  end
end

describe "#player" do
  xit "should know the current player" do
  end
end
