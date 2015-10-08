module AI
  def next_move game
    play = game.board.get_available_positions.sample
    a = minmax(game, game.player)
    play
    # puts "Max plays: " if __FILE__ == $0
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

  def minmax game, players, move=nil
    cloned_players = players.dup
    return score game if game.over?
    scores = []
    moves = []
    game.board.get_available_positions do |next_move|
      possible_game = game.get_new_state(next_move, cloned_players[0])
      cloned_players.rotate!
      score << minmax(possible_game, cloned_players, next_move)
      binding.pry
    end
  end
end
