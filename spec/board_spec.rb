require 'spec_helper'

describe Board do
  let(:board) { described_class.new }

  describe "#valid_position?" do
    it "should know whether a position is empty or not" do
      board.state = ["X", "O", "O", "X", nil, "X", "X", "X", "O"]
      expect(board.valid_position?(5)).to be true
      expect(board.valid_position?(1)).to be false
    end
  end

  describe "#get_available_positions" do
    it "should know all available positions" do
      board.state = ["O", nil, nil, nil, "O", nil, "X", "X", "O"]
      expect(board.get_available_positions).to eq [2, 3, 4, 6]
    end
  end

  describe "#get_new_state" do
    it "should return the next board state given a position to play" do
      board.state = ["O", nil, nil, nil, "O", nil, "X", "X", "O"]
      expect(board.new_board(2, "X").state).to eq ["O", "X", nil, nil, "O", nil, "X", "X", "O"]
    end
  end
end
