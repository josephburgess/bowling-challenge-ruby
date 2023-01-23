require 'frame'

describe Frame do
  context 'Both rolls have been thrown' do
    it 'returns the correct score' do
      frame = Frame.new(1, 5)
      expect(frame.total_score).to equal 6
      expect(frame.is_strike?).to equal false
      expect(frame.is_spare?).to equal false
    end
  end

  context 'player gets a spare' do
    it 'marks frame as a spare' do
      frame = Frame.new(6, 4)
      expect(frame.total_score).to equal 10
      expect(frame.is_strike?).to equal false
      expect(frame.is_spare?).to equal true
    end
  end

  context 'player gets a strike' do
    it 'marks frame as a strike' do
      frame = Frame.new(10, 0)
      expect(frame.total_score).to equal 10
      expect(frame.is_strike?).to equal true
      expect(frame.is_spare?).to equal false
    end
  end
end
