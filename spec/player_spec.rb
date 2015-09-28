require 'spec_helper'

describe '#play' do
  
  let(:board) { Board.new }
  let(:ai_min) { ComputerMin.new("x") }
  let(:ai_max) { ComputerMax.new("o") }

  it "should add the player's mark on the board when given a position" do
    ai_min.play(board, 0)
    ai_max.play(board, 0)
    ai_max.play(board, 1)
    expect(board.state).to eq(["x","o"," "," "," "," "," "," "," "])
  end
end
