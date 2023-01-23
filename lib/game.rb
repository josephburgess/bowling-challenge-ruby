require_relative 'frame'

class Game
  def initialize
    @scorecard = []
  end

  def add(frame)
    @scorecard << frame.to_hash
  end
end
