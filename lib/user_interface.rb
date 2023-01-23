require_relative 'game'
require_relative 'frame'

class UserInterface
  attr_accessor :scorecard

  def initialize(io, game)
    @io = io
    @game = game
    @frame_count = 1
  end

  def run
    show 'Welcome to your bowling scorecard!'
    until @frame_count == 10
      show "You are on frame #{@frame_count}."
      input_rolls
      show_current_score
    end
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    @io.gets.chomp.to_i
  end

  def input_rolls
    roll_1 = prompt 'Input your roll:'
    if roll_1 > 10
      show 'Invalid input'
      input_rolls
    elsif roll_1 == 10
      show 'You got a strike!'
      roll_2 = 0
      record_frame(roll_1, roll_2)
    else
      input_second_roll(roll_1)
    end
  end

  def input_second_roll(roll_1)
    roll_2 = prompt "You got #{roll_1}, please input second roll:"
    if roll_1 + roll_2 > 10
      show 'Invalid input'
      input_second_roll
    elsif roll_1 + roll_2 == 10
      show 'You got a spare!'
      record_frame(roll_1, roll_2)
    else
      show "You got #{roll_1 + roll_2}"
      record_frame(roll_1, roll_2)
    end
  end

  def record_frame(roll_1, roll_2)
    frame = Frame.new(roll_1, roll_2)
    @game.add(frame)
    @frame_count += 1
  end

  def show_current_score
    show "Your current score is #{@game.calculate_total_score}"
  end
end
