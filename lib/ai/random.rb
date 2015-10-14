class Random
  def next_move game
    game.board.get_available_positions.sample
  end

  def name
    "Frederick Random"
  end
end
