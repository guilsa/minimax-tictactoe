class Game
  attr_accessor :board, :players
  attr_reader :display

  def initialize board, players, display
    @board = board
    @players = players
    @display = case display
               when :terminal then TerminalDisplay.new
               when :html then HTMLDisplay.new
               end
  end

  def play_the_game
    until over?
      move = current_player.next_move(self)
      current_player.play @board, move
      @display.position current_player, move
      @board.display
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
