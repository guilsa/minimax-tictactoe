require 'spec_helper'

describe "Human#next_move" do
  xit "should return a valid user input" do

  end
end

describe "Min#next_move" do
  xit "should return a valid move" do

  end
end

describe '#play' do

  let(:board) { Board.new }
  let(:ai_min) { Computer.new("x", Min.new) }
  let(:ai_max) { Computer.new("o", Max.new) }

  it "should add the player's mark on the board when given a position" do
    ai_min.play(board, 0)
    ai_max.play(board, 0)
    ai_max.play(board, 1)
    expect(board.state).to eq(["x","o"," "," "," "," "," "," "," "])
  end
end
