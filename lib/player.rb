## ATTENTION - MAY HAVE TO CALL SUPER!

class Player
  attr_reader :mark, :decide_position, :play

  def initialize mark
    @mark = mark
  end

  def play board, position
    board.state[position] = @mark if board.valid_position?(position)
  end

  def decide_position
  end

end

class ComputerMin < Player
  def decide_position
    Random.rand(9)
  end
end

class ComputerMax < Player
  def decide_position
    Random.rand(9)
  end
end

class Human < Player
  def decide_position
  end
end
