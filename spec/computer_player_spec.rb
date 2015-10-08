require 'spec_helper'

describe "#score" do
  it "should return 0 if current game state has no winner" do
    initialize_human_vs_computer
    @computer.extend(AI)
    @board.state = ["O", "O", " ", "X", "X", " ", " ", " ", " "]
    expect(@computer.score(@game)).to be(0)
  end

  it "should return 1 if current game state has computer as winner" do
    initialize_human_vs_computer
    @computer.extend(AI)
    @board.state = ["X", "X", "X", "O", " ", "O", "O", " ", ""]
    expect(@computer.score(@game)).to be(1)
  end

  it "should return -1 if current game state has human as winner" do
    initialize_human_vs_computer
    @computer.extend(AI)
    @board.state = ["O", "O", " ", " ", "O", "X", "X", "X", "O"]
    expect(@computer.score(@game)).to be(-1)
  end
end

describe "#minmax" do
  # Not so necessary since it's being done on the #score spec
  it "should correctly score an ended game state" do
    initialize_human_vs_computer
    @computer.extend(AI)
    # Computer is winner
    @board.state = [" ", "O", "O", "X", "X", "X", "X", " ", " "]
    expect(@computer.minmax(@game)).to be(1)
    # Draw
    @board.state = ["X", "O", "X", "X", "X", "O", "O", "X", "O"]
    expect(@computer.minmax(@game)).to eq(0)
    # Human is winner
    @board.state = ["O", "O", " ", " ", "O", "X", "X", "X", "O"]
    expect(@computer.minmax(@game)).to be(-1)
  end

  it "should fill a scores and moves array" do
    initialize_with_two_computers

    @computer.extend(AI)
    # Computer is winner
    @board.state = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    expect(@computer.minmax(@game)).to eq(0)
  end

end
