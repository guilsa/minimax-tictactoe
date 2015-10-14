class MinMax
  def score game
    if game.winner.mark == "X"
      return +1
    elsif game.winner.mark == "0"
      return -1
    else
      return 0
    end
  end

  def next_move game
    return score game if game.over?

    results = []
    moves = []

    game.board.get_available_positions do |next_move|
      possible_game = game.get_new_game(next_move)
      results << minmax(possible_game)
    end

    game.board.get_available_positions.sample
  end

  def name
    "Minual Maximillion"
  end
end
