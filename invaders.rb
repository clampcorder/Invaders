require 'gosu'

require './alien'
require './bullet'
require './config'
require './event_handler'
require './player'

class InvadersGame < Gosu::Window
  def initialize
    super(Config::WINDOW_X, Config::WINDOW_Y, Config::FULLSCREEN)
    EventHandler.register_listener(:shoot, self, :spawn_bullet)
    @player = Player.new
    @aliens = [Alien.new]
    @bullets = []
    @spawn_timer = 0
  end

  def button_down(id)
    @player.button_down(id)
  end

  def button_up(id)
    @player.button_up(id)
  end

  def update
    @spawn_timer += 1
    if @spawn_timer > 64 then
      @aliens << Alien.new
      @spawn_timer = 0
    end
    @player.update
    @aliens.each(&:update)
    @aliens.reject! { |bullet| bullet.is_dead? }
    @bullets.reject! { |bullet| bullet.is_dead? }
    @bullets.each(&:update)
  end

  def draw
    @player.draw
    @aliens.each(&:draw)
    @bullets.each(&:draw)
  end

  def spawn_bullet(context)
    @bullets << Bullet.new(
      context[:x]
    )
  end
end

InvadersGame.new.show
