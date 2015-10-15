class Display
  def notice msg
    msg
  end

  def your_turn mark
    "Your turn (you are #{mark}). Numbers represent locations:"
  end

  def winner winner
    "Winner: #{winner.name} as #{winner.mark}."
  end

  def position current_player, move
    "#{current_player} played at position #{move}"
  end
end

class TerminalDisplay

  def initialize
    @display = Display.new
  end

  def your_turn mark
    puts @display.your_turn mark
  end

  def display_winner winner
    puts @display.display_winner winner
  end

  def notice msg
    puts @display.notice msg
  end

  def position current_player, move
    puts @display.position current_player, move
  end

  def winner winner
    puts @display.winner winner
  end
end


class HTMLDisplay
end
