require 'spec_helper'

describe "#valid_position?" do
  it "should know whether a position is empty or not" do

    initialize_with_two_computers

    @board.state = ["X", "O", "O", "X", " ", "X", "X", "X", "O"]
    expect(@board.valid_position?(4)).to be(true)
    expect(@board.valid_position?(0)).to be(false)
  end
end

describe "#get_available_positions" do
  xit "should know all available positions" do
  end
end

describe "#get_new_state" do
  xit "should return the next board state given a position to play" do
  end
end

# describe "make_board_state" do
#   let(:board) { Board.new }
#   xit "should return an array representing new board state given a play position" do
#     board.make_board_state(5)
#   end
# end
