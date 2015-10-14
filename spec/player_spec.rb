require 'spec_helper'

describe Player do
  describe '#play' do
    let(:board) { Board.new ["O", "O", nil, nil, "O", "X", "X", "X", "O"] }
    let(:ai_x) { ComputerPlayer.new "X", :min_max }

    it "should add the player's mark on the board" do
      ai_x.play board, 3
      expect(board[3]).to eq "X"
    end

    it "should fail if the position is already taken" do
      expect { ai_x.play board, 1 }.to raise_error ArgumentError
    end
  end
end
