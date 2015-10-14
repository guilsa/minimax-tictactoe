module Player
  attr_reader :mark

  def initialize mark
    @mark =  mark
  end

  def play board, position
    raise "Bad position - already played: #{position + 1}" unless board.valid_position?(position)

    board.state[position] = @mark
    puts "#{name} played #{mark} at position #{position + 1}"
  end
end
