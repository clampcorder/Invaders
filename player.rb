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
      @direction = -1
    when Config::PLAYER_1_BINDINGS[:right]
      @direction = +1
    else

    end
  end

  def button_up(id)
    @direction = 0
  end

  def update
    @position[0] = (@position[0] + @direction)
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