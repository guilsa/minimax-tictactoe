require 'spec_helper'

describe "state" do
  it "should return a board state" do
    board = Board.new
    expect(board.state).to eq([" ", " ", " "," ", " ", " "," ", " ", " "])
  end
end

# describe "make_board_state" do
#   let(:board) { Board.new }
#   xit "should return an array representing new board state given a play position" do
#     board.make_board_state(5)
#   end
# end
