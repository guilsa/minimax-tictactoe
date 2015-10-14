class Board
  attr_accessor :state

  def initialize(state=nil)
      @state = (state || Array.new(9))
  end

  def valid_position? position
    @state[position].nil?
  end

  def get_available_positions
    @state.each.with_index.select { |mark, index| mark.nil? }.map { |mark, index| index }
  end

  def get_new_state position, mark
    new_state = @state.dup
    new_state[position] = mark
    board = self.class.new new_state
    return board
  end

  def [](position)
    @state[position]
  end

  def []=(position, mark)
    @state[position] = mark
  end

  def display
    puts
    0.upto 8 do |pos|
      value = @state[pos] || (pos + 1)
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
