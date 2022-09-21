class Bullet
  def initialize(x)
    
    width = Config::PIXEL_SIZE / 4
    height = Config::PIXEL_SIZE
    @id = rand(2**128)
    @dead = false
    @image = Gosu::Image.from_blob(
      width,
      height,
      "\255\255\255\255" * (width * height),
    )
    @position = [
      x - width / 2,
      Config::WINDOW_Y - (6 * Config::PIXEL_SIZE)
    ]
    EventHandler.register_listener(:bullet_hit, self, :check_bullet_hit)
  end

  def is_dead?
    @dead
  end

  def check_bullet_hit(context)
    return unless @dead == false
    if @id == context[:id] then
      @dead = true
    end
  end

  def update
    @position[1] -= 8
    EventHandler.publish_event(:bullet_moved, {:position => @position, :id => @id})
    if @position[1] <= 0 - Config::PIXEL_SIZE
      @dead = true
    end

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