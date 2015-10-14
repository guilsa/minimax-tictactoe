require 'forwardable'

require_relative 'ai/random'
require_relative 'ai/min_max'
require_relative 'player'

class ComputerPlayer
  extend Forwardable
  include Player

  def initialize mark, game_strategy
    super mark

    @game_strategy = case game_strategy
                     when :random then Random.new
                     when :min_max then MinMax.new
                     else
                       raise ArgumentError, "Bad strategy: #{game_strategy.inspect}"
                     end
  end

  def_delegators :@game_strategy, :next_move, :name
end
