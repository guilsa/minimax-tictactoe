class Player

  def play board, position
    board.state[position] = @mark if board.valid_position?(position)
  end

  def get_position
  end

end

class Human < Player

  def get_position
  end

end

class Computer < Player

  attr_accessor :game_strategy

  def initialize mark, game_strategy
    @mark = mark
    @game_strategy = game_strategy
  end

  def get_position
    @game_strategy.get_position
  end

end

class Min
  def get_position
    Random.rand(9)
  end
end

class Max
  def get_position
    Random.rand(9)
  end
end

# Terminal/web input for human to make a decision
# class IO
#   def get_position
#   end
# end
