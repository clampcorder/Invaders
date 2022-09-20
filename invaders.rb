require 'gosu'

require './bullet'
require './config'
require './event_handler'
require './player'

class InvadersGame < Gosu::Window
  def initialize
    super(Config::WINDOW_X, Config::WINDOW_Y, Config::FULLSCREEN)
    EventHandler.register_listener(:shoot, self, :spawn_bullet)
    @player = Player.new
    @bullets = []
  end

  def button_down(id)
    @player.button_down(id)
  end

  def button_up(id)
    @player.button_up(id)
  end

  def update
    @player.update
    @bullets.reject! { |bullet| bullet.is_dead? }
    @bullets.each(&:update)
  end

  def draw
    @player.draw
    @bullets.each(&:draw)
  end

  def spawn_bullet(context)
    @bullets << Bullet.new(
      context[:x]
    )
  end
end

InvadersGame.new.show
