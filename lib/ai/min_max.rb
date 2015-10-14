class MinMax
  def score game
    if game.winner.nil?
      0
    elsif game.winner.mark == "X"
      +1
    elsif game.winner.mark == "O"
      -1
    end
  end

  def next_move game
    min_max game
    @choice
  end

  def name
    "Minual Maximillion"
  end

private
  def min_max game
    return score game if game.over?

    scores = []
    moves = []

    game.board.get_available_positions.each do |move|
      possible_game = game.get_new_game(move)
      scores << min_max(possible_game)
      moves << move
    end

    if game.current_player.mark == "X"
      # This is the max calculation
      max_score_index = scores.each_with_index.max[1]
      @choice = moves[max_score_index]
      return scores[max_score_index]
    else
      # This is the min calculation
      min_score_index = scores.each_with_index.min[1]
      @choice = moves[min_score_index]
      return scores[min_score_index]
    end
  end
end
