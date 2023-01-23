require_relative 'frame'

class Game
  def initialize
    @scorecard = []
  end

  def add(frame)
    @scorecard << frame.to_hash
  end

  def calculate_total_score
    total = 0
    @scorecard.each_with_index do |frame, index|
      if frame[:is_spare?]
        frame[:total_score] += @scorecard[index + 1][:roll_1]
        total += frame[:total_score]
      elsif frame[:is_strike?]
        frame[:total_score] += @scorecard[index + 1][:roll_1]
        frame[:total_score] += @scorecard[index + 1][:roll_2]
        total += frame[:total_score]
      else
        total += frame[:total_score]
      end
    end
    total
  end
end
