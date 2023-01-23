require_relative '../lib/user_interface'
RSpec.describe UserInterface do
  describe 'bowling ' do
    it 'asks the user to input their rolls' do
      io = double(:io)
      game = double(:game, scorecard: [])
      frame = Frame.new(10, 0)
      interface = UserInterface.new(io, game)
      expect(io).to receive(:puts).with('Welcome to your bowling scorecard!')
      expect(io).to receive(:puts).with('You are on frame 1.')
      expect(io).to receive(:puts).with('Input your roll:')
      expect(io).to receive(:gets).and_return('10')
      expect(io).to receive(:puts).with('You got a strike!')
      expect(game).to receive(:add).with(an_instance_of(Frame))
      expect(game).to receive(:calculate_total_score).and_return('10')
      expect(io).to receive(:puts).with('Your current score is 10')
      expect(io).to receive(:puts).with('You are on frame 2.')
      expect(io).to receive(:puts).with('Input your roll:')
      expect(io).to receive(:gets).and_return('0')
      interface.run
    end
  end
end
