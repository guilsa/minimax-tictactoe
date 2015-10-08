module AI
  def next_move game
    minmax game
    # play = game.board.get_available_positions.sample
    # play
  end

  def score game
    if game.winner == game.computer
      return 1
    elsif game.winner == game.human
      return -1
    else
      return 0
    end
  end

  def minmax game
    return score game if game.over?

    results = []
    moves = []

    game.board.get_available_positions do |next_move|
      possible_game = game.get_new_game(next_move)
      results << minmax(possible_game)
    end

    
    binding.pry

  end
end
