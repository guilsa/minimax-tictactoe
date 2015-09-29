class Board
  attr_accessor :state
  def initialize
    @state = Array.new(9, " ")
  end

  def valid_position? position
    @state[position] == " "
  end

  def get_available_positions
    # "x" ===> |mark|
    # ["x", 4] ===> |mark, index|
    # [["x", 4], []] => |(mark, index), poses]
    # somethings called splatting
    @state.each.with_index.with_object([]) { |(mark, index), poses| poses << index if mark == " " }
  end

  def print
    puts ""
    puts " #{state[0]} | #{state[1]} | #{state[2]}  "
    puts "---+---+---"
    puts " #{state[3]} | #{state[4]} | #{state[5]}  "
    puts "---+---+---"
    puts " #{state[6]} | #{state[7]} | #{state[8]}  "
    puts ""
  end


end
