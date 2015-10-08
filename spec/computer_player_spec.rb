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
