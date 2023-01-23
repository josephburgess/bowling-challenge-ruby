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
      next_frame = @scorecard[index + 1]
      next_next_frame = @scorecard[index + 2]

      if frame[:is_spare?]
        frame[:total_score] += next_frame[:roll_1]
        total += frame[:total_score]
      elsif frame[:is_strike?] && next_frame[:is_strike?]
        frame[:total_score] += next_frame[:roll_1] + next_next_frame[:roll_1]
        total += frame[:total_score]
      elsif frame[:is_strike] && next_frame[:is_strike?] == false
        frame[:total_score] += next_frame[:roll_1] + next_frame[:roll_2]
        total += frame[:total_score]
      else
        total += frame[:total_score]
      end
    end
    total
  end
end
