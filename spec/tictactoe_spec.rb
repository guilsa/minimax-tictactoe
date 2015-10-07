require 'spec_helper'

describe "#play_the_game" do

  before do
    allow_message_expectations_on_nil
    allow(@game).to receive(:winner).and_return(true)
  end

  it "should start and end the game with a winner or a draw" do

    initialize_with_two_computers
    play_until_winner

    expect(@game.winner.mark).to be_an(String)
  end
end

describe "#winner" do

  it "should know who won or if there's currently no winner" do

    initialize_with_two_computers

    @board.state = [" ", "O", "O", "X", "X", "X", "X", " ", " "]
    expect(@game.winner).to eq(@ai_max)

    @board.state = [" ", "O", "O", "X", " ", "X", "X", " ", " "]
    expect(@game.winner).to eq(nil)

    @board.state = ["O", "O", " ", " ", "O", "X", "X", "X", "O"]
    expect(@game.winner).to eq(@ai_min)

  end
end

describe "#draw?" do
  it "should know if the board is filled up" do

    initialize_with_two_computers

    @board.state = ["X", "O", "O", "X", "O", "X", "X", "X", "O"]
    expect(@game.draw?).to be(true)

    @board.state = [" ", "O", "O", "X", "O", "X", "X", "X", "O"]
    expect(@game.draw?).to be(false)

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
