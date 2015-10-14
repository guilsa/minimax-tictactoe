class Game
  attr_accessor :board, :players

  def initialize board, players
    @board = board
    @players = players
  end

  def play_the_game
    until over?
      current_player.play @board, current_player.next_move(self)
      next_player
    end
  end

  def over?
    !winner.nil? || draw?
  end

  def current_player
    @players[0]
  end

private
  def next_player
    @players.rotate!
  end
end
