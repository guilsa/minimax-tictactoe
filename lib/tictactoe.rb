require 'board'
require 'player'
require 'pry'

class Game

# Instance variables get initialized here via dependency inversion
  def play_the_game board, players
    @board = board
    @players = players
    until game_over?
      player.play board, player.get_position
      take_turns @players
    end
  end

  def game_over?
    !!winner || draw?
  end

  def take_turns players
    @players.rotate!
  end

  def player
    @players[0]
  end

end

class Tictactoe < Game

  WIN_POS = [[0, 3, 6], [1, 4, 7], [2, 5, 8],
             [0, 1, 2], [3, 4, 5], [6, 7, 8],
             [0, 4, 8], [2, 4, 6]]

  def winner
    saved_positions = []
    WIN_POS.each do |some|
      some.each { |position| saved_positions << @board.state[position] }

      @players.each do |player|
        return player if saved_positions.all? { |i| i == player.mark }
      end
      saved_positions.clear
    end
    return nil
  end

  def draw?
    !@board.state.include?(" ")
  end

  def print_board
    puts ""
    puts " #{@board.state[0]} | #{@board.state[1]} | #{@board.state[2]}  "
    puts "---+---+---"
    puts " #{@board.state[3]} | #{@board.state[4]} | #{@board.state[5]}  "
    puts "---+---+---"
    puts " #{@board.state[6]} | #{@board.state[7]} | #{@board.state[8]}  "
    puts ""
  end

end

class State

  # Thinking that I need a method to override order of players.
  # But Game already has #take_turns, it already does the overriding.
  # So I need to inject game and access game.player
  # Then do new_game_state take_turns if new_game_state.player !== game.player
  # Thing is, everytime get_new_state is called.
  # Shit, looks like my design/organization is wrong, it shouldn't be that complicated.


  def get_new_state board_state, current_game
    new_game = Game.new
    new_board_state = Board.new
    new_board_state = board_state
    ai_max = Computer.new("x", Max.new)
    ai_min = Computer.new("o", Min.new)
    players = [ai_max, ai_min]
  end

end
