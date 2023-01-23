require 'game'
require 'frame'

describe Game do
  before(:each) do
    @game = Game.new
    @frame_spare = Frame.new(5, 5)
    @frame_strike = Frame.new(10, 0)
    @frame_regular = Frame.new(3, 4)
  end
  context 'when a spare is scored' do
    it 'calculates the bonus correctly' do
      @game.add(@frame_spare)
      @game.add(@frame_regular)
      expect(@game.calculate_total_score).to eq 20
    end
  end

  context 'when a strike is scored' do
    it 'calculates the bonus correctly' do
      @game.add(@frame_strike)
      @game.add(@frame_regular)
      expect(@game.calculate_total_score).to eq 24
    end
  end

  context 'when two strikes in a row are scored' do
    it 'calculates the bonus correctly' do
      @game.add(@frame_strike)
      @game.add(@frame_strike)
      @game.add(@frame_regular)
      @game.add(@frame_regular)
      @game.add(@frame_regular)
      expect(@game.calculate_total_score).to eq 61
    end
  end
end
