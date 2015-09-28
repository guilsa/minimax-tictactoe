class Board
  attr_accessor :state
  def initialize
    @state = Array.new(9, " ")
  end

  def valid_position? position
    return @state[position] == " " ? true : false
  end

end
