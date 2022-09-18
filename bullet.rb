class Bullet
  def initialize(x)
    
    width = Config::PIXEL_SIZE / 4
    height = Config::PIXEL_SIZE
    @image = Gosu::Image.from_blob(
      width,
      height,
      "\255\255\255\255" * (width * height),
    )
    @position = [
      x - width / 2,
      Config::WINDOW_Y - (6 * Config::PIXEL_SIZE)
    ]
  end

  def update
    @position[1] -= 8
    # TODO, destroy self when hit the end, or, publish event so main game can
    # destroy and clean reference to this
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