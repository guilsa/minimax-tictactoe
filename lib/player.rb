module Player
  attr_reader :mark

  def initialize mark
    @mark = mark
  end

  def play board, position
    board[position] = @mark
  end

  def to_s
  	"#{name} (#{mark})"
  end
end
