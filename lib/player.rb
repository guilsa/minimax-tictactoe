require 'forwardable'

module Player
  attr_accessor :mark
  def play board, position
    @board = board
    @board.state[position] = @mark if @board.valid_position?(position)
  end
end
