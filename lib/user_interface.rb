require_relative 'game'
require_relative 'frame'

class UserInterface
  attr_accessor :scorecard

  def initialize(io, game)
    @io = io
    @game = game
    @frame_count = 1
  end
end
