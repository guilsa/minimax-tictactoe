module Player
  attr_reader :mark

  def initialize mark
    @mark =  mark
  end

  def play board, position
    raise "Bad position - already played: #{position + 1}" unless board.valid_position?(position)

    board[position] = @mark
  end

  def to_s
  	"#{name} (#{mark})"
  end
end
