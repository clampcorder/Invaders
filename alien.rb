require './event_handler'

class Alien

  def initialize
    # TODO, write a grid/coorinate system provider
    # Offset a block from the top, and from the left edge
    @position = [
      Config::PIXEL_SIZE, 
      Config::PIXEL_SIZE,
    ]
    @direction = 0
    @image = Gosu::Image.from_blob(
      Config::PIXEL_SIZE, 
      Config::PIXEL_SIZE,
      "\255\255\255\255" * (Config::PIXEL_SIZE ** 2),
    )
    @update_count = 0
  end
  

  def update
    @update_count += 1
    return unless @update_count > Config::DELAY_ALIEN
    @update_count = 0

    if @position[0] <= Config::WINDOW_X - 4 * Config::PIXEL_SIZE then
      @position[0] += 2* Config::PIXEL_SIZE
    else
      # Typewriter / ZIG-ZAG
      @position[1] += 2* Config::PIXEL_SIZE
      @position[0] = Config::PIXEL_SIZE
    end
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