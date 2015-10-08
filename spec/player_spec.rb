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

# describe "Min#next_move" do
#   xit "should return a valid move" do
#
#   end
# end
