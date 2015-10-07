require 'spec_helper'

describe '#play' do

  # let(:board) { Board.new }
  # let(:ai_min) { Computer.new("x", Min.new) }
  # let(:ai_max) { Computer.new("o", Max.new) }

  it "should add the player's mark on the board" do

    initialize_with_two_computers

    @board.state = ["O", "O", " ", " ", "O", "X", "X", "X", "O"]

    @game.player.play(@board, 2)
    expect(@board.state).to eq(["O", "O", "X", " ", "O", "X", "X", "X", "O"])
  end
end

describe "#score" do
  it "should return 0 if current game state has no winner" do
    initialize_human_vs_computer
    ai = AI.new
    @board.state = ["O", "O", " ", "X", "X", " ", " ", " ", " "]
    expect(ai.score(@game)).to be(0)
  end

  it "should return 1 if current game state has computer as winner" do
    initialize_human_vs_computer
    ai = AI.new
    @board.state = ["X", "X", "X", "O", " ", "O", "O", " ", ""]
    expect(ai.score(@game)).to be(1)
  end

  it "should return -1 if current game state has human as winner" do
    initialize_human_vs_computer
    ai = AI.new
    @board.state = ["O", "O", " ", " ", "O", "X", "X", "X", "O"]
    expect(ai.score(@game)).to be(-1)
  end
end

# describe "Min#next_move" do
#   xit "should return a valid move" do
#
#   end
# end
