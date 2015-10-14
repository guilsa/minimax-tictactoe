require 'spec_helper'

describe Player do
  describe '#play' do
    let(:board) { Board.new }
    let(:ai_x) { ComputerPlayer.new "X", :min_max }

    it "should add the player's mark on the board" do
      board.state = ["O", "O", nil, nil, "O", "X", "X", "X", "O"]
      ai_x.play board, 2
      expect(board.state).to eq(["O", "O", "X", nil, "O", "X", "X", "X", "O"])
    end

    it "should fail if the position is already taken" do
      board.state = ["O", "O", nil, nil, "O", "X", "X", "X", "O"]
      expect { ai_x.play board, 1 }.to raise_error RuntimeError
    end
  end
end
