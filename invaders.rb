require 'gosu'

require './config'
require './player'

class InvadersGame < Gosu::Window
  def initialize
    super(Config::WINDOW_X, Config::WINDOW_Y, Config::FULLSCREEN)
    @player = Player.new
  end

  def button_down(id)
    @player.button_down(id)
  end

  def button_up(id)
    @player.button_up(id)
  end

  def update
    @player.update
  end

  def draw
    @player.draw
  end
end

InvadersGame.new.show
