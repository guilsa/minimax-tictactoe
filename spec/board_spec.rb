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
  it "should know all available positions" do

    initialize_with_two_computers

    @board.state = ["O", " ", " ", " ", "O", " ", "X", "X", "O"]
    expect(@board.get_available_positions).to eq( [1,2,3,5] )
  end
end

describe "#get_new_state" do
  it "should return the next board state given a position to play" do

    initialize_with_two_computers
    @board.state = ["O", " ", " ", " ", "O", " ", "X", "X", "O"]
    expect(@board.get_new_state(1, "X").state).to eq(["O", "X", " ", " ", "O", " ", "X", "X", "O"])
  end
end
