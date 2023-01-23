class Frame
  attr_accessor :roll_1, :roll_2

  def initialize(roll_1, roll_2)
    @roll_1 = roll_1
    @roll_2 = roll_2
  end

  def total_score
    @roll_1 + @roll_2
  end

  def is_strike?
    @roll_1 == 10
  end

  def is_spare?
    if @roll_1 + @roll_2 == 10 && @roll_1 != 10
      true
    else
      false
    end
  end

  def to_hash
    {
      roll_1: roll_1,
      roll_2: roll_2,
      total_score: total_score,
      is_spare?: is_spare?,
      is_strike?: is_strike?
    }
  end
end
