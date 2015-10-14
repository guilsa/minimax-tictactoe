class Game
  attr_accessor :board, :players

  def initialize board, players
    @board = board
    @players = players
  end

  def play_the_game
    until over?
      move = current_player.next_move(self)
      current_player.play @board, move
      puts "#{current_player} played at position #{move + 1}"
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
