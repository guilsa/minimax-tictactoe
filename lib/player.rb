class Player
  attr_reader :mark

  def initialize mark
    @mark = mark
  end

  def play board, position
    board.state[position] = @mark if board.valid_position?(position)
  end

  private


end

class ComputerMin < Player
  def decide
  end
end

class ComputerMax < Player
  def decide
  end
end

class Human < Player
  def decide
  end
end
