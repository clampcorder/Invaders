require './event_handler'

class Player

  def initialize
    # TODO, write a grid/coorinate system provider
    @position = [
      Config::WINDOW_X / 2, 
      Config::WINDOW_Y - (4 * Config::PIXEL_SIZE),
    ]
    @direction = 0
    @image = Gosu::Image.from_blob(
      Config::PIXEL_SIZE, 
      Config::PIXEL_SIZE,
      "\255\255\255\255" * (Config::PIXEL_SIZE ** 2),
    )
  end
  
  def button_down(id)
    case id
    when Config::PLAYER_1_BINDINGS[:left]
      @direction = -2
    when Config::PLAYER_1_BINDINGS[:right]
      @direction = +2
    when Config::PLAYER_1_BINDINGS[:shoot]
      EventHandler.publish_event(:shoot, {:x => @position[0] + Config::PIXEL_SIZE / 2})
    else

    end
  end

  def button_up(id)
    if [
      Config::PLAYER_1_BINDINGS[:left], Config::PLAYER_1_BINDINGS[:right]
    ].include? id then
      @direction = 0
    end
  end

  def update
    @position[0] = (@position[0] + @direction).clamp(
      0, Config::WINDOW_X-Config::PIXEL_SIZE
    )
  end

  def draw
    x = @position[0]
    y = @position[1]
    @image.draw(
      x,
      y,
    )
  end

  

end