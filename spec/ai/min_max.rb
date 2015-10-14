require 'spec_helper'

describe "#score" do
  it "should return 0 if current game state has no winner" do
    initialize_human_vs_computer
    @game.board.state = ["O", "O", nil, "X", "X", nil, nil, nil, nil]
    expect(@computer.score(@game)).to eq 0
  end

  it "should return 1 if current game state has computer as winner" do
    initialize_human_vs_computer
    @game.board.state = ["X", "X", "X", "O", nil, "O", "O", nil, ""]
    expect(@computer.score(@game)).to eq +1
  end

  it "should return -1 if current game state has human as winner" do
    initialize_human_vs_computer
    @game.board.state = ["O", "O", nil, nil, "O", "X", "X", "X", "O"]
    expect(@computer.score(@game)).to eq -1
  end
end

describe "#play" do
  # Not so necessary since it's being done on the #score spec
  it "should correctly score an ended game state" do
    initialize_human_vs_computer
    # Computer is winner
    @game.board.state = [nil, "O", "O", "X", "X", "X", "X", nil, nil]
    expect(@computer.play(@game)).to be 1
    # Draw
    @game.board.state = ["X", "O", "X", "X", "X", "O", "O", "X", "O"]
    expect(@computer.play(@game)).to eq 0
    # Human is winner
    @game.board.state = ["O", "O", nil, nil, "O", "X", "X", "X", "O"]
    expect(@computer.play(@game)).to eq -1
  end

  it "should fill a scores and moves array" do
    initialize_with_two_computers

    # Computer is winner
    @game.board.state = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    expect(@computer.play(@game)).to eq 0
  end

end
