class Board
  attr_accessor :state
  EMPTY = " "

  def initialize(state=nil)
      @state = (state || Array.new(9, EMPTY))
  end

  def valid_position? position
    @state[position] == EMPTY
  end

  def get_available_positions
    @state.each.with_index.with_object([]) { |(mark, index), positions| positions << index if mark == EMPTY }
  end

  def display
    puts ""
    puts " #{state[0] == EMPTY ? "1" : state[0]} | #{state[1] == EMPTY ? "2" : state[1]} | #{state[2] == EMPTY ? "3" : state[2]}  "
    puts "---+---+---"
    puts " #{state[3] == EMPTY ? "4" : state[3]} | #{state[4] == EMPTY ? "5" : state[4]} | #{state[5] == EMPTY ? "6" : state[5]}  "
    puts "---+---+---"
    puts " #{state[6] == EMPTY ? "7" : state[6]} | #{state[7] == EMPTY ? "8" : state[7]} | #{state[8] == EMPTY ? "9" : state[8]}  "
    puts ""
  end

  def get_new_state position, mark
    new_state = @state.dup
    new_state[position] = mark
    board = self.class.new new_state
    return board
  end

end
