$LOAD_PATH << 'lib'
require 'game'
require 'frame'
require 'user_interface'

class TerminalIO
  def gets
    Kernel.gets
  end

  def puts(message)
    Kernel.puts(message)
  end
end

io = TerminalIO.new
game = Game.new
user_interface = UserInterface.new(io, game)
user_interface.run
