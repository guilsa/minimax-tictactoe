class Board
  attr_accessor :state

  def initialize state=nil
    @state = (state || Array.new(9))
  end

  def valid_position? position
    self[position].nil?
  end

  def get_available_positions
    @state.each.with_index(1).select { |mark, index| mark.nil? }.map { |mark, index| index }
  end

  def new_board position, mark
    board = self.class.new @state.dup
    board[position] = mark
    board
  end

  def [] position
    raise IndexError, "Bad position: #{position}" unless position.between?(1, 9)
    @state[position - 1]
  end

  def []= position, mark
    raise ArgumentError, "Position already taken: #{position}" unless valid_position? position
    @state[position - 1] = mark
  end

  def full?
    !@state.include?(nil)
  end

  def display
    puts
    @state.each.with_index do |value, pos|
      value ||= (pos + 1)
      if pos % 3 == 1
        print "| #{value} |"
      else
        print " #{value} "
      end

      puts "\n---+---+---" if [2, 5].include? pos
    end
    puts
  end
end
