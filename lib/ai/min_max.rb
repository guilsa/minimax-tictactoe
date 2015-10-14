class MinMax
  def next_move game
    _, move = min_max game
    move
  end

  def name
    "Minual Maximillion"
  end

private
  def min_max game
    return [score(game), nil] if game.over?

    scores = []

    game.board.get_available_positions.each do |move|
      possible_game = game.get_new_game(move)
      score, the_move = min_max(possible_game)
      the_move = move if the_move.nil?
      scores << [score, the_move]
    end

    if game.current_player.mark == "X"
      scores.max
    else
      scores.min
    end
  end

  def score game
    if game.winner.nil?
      0
    elsif game.winner.mark == "X"
      +1
    elsif game.winner.mark == "O"
      -1
    end
  end
end
