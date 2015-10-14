require 'spec_helper'

describe Tictactoe do
  before do
    initialize_with_two_computers
  end

  describe "#play_the_game" do
    it "should end the game with a winner or a draw" do
      play_until_winner
      expect([@ai_X, @ai_O, nil]).to include @game.winner
    end
  end

  describe "#winner" do
    it "should know there's currently no winner" do
      @game.board.state = [nil, "O", "O", "X", nil, "X", "X", nil, nil]
      expect(@game.winner).to be nil
    end

    it "should know if X has won" do
      @game.board.state = [nil, "O", "O", "X", "X", "X", "X", nil, nil]
      expect(@game.winner).to eq @ai_X
    end

    it "should know if O has won" do
      @game.board.state = ["O", "O", "O", nil, "O", nil, "X", "X", "O"]
      expect(@game.winner).to eq @ai_O
    end
  end

  describe "#draw?" do
    it "should know if the board is filled up" do
      @game.board.state = ["X", "O", "O", "X", "O", "X", "X", "O", "O"]
      expect(@game.draw?).to be true
    end

    it "should know if the board is not filled up" do
      @game.board.state = [nil, "O", "O", "X", "O", "X", "X", "X", "O"]
      expect(@game.draw?).to be false
    end
  end

  describe "#get_new_game" do
    it "should return a new game with next board state given a position" do
      @game.board.state = ["O", nil, nil, nil, nil, nil, "X", "X", "O"]
      expect(@game.get_new_game(1).board.state).to eq ["O", "X", nil, nil, nil, nil, "X", "X", "O"]
    end
  end
end

# Private methods don't have to be tested
# describe "#take_turns" do
#   it "should should rotate players" do
#   end
# end
# describe "#player" do
#   xit "should know the current player" do
#   end
# end
