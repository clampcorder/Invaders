require 'gosu'

module Config
  PIXEL_SIZE = 20
  PIXELS_X = 20
  PIXELS_Y = 20
  OFFSET_X = 64
  OFFSET_Y = 32
  FULLSCREEN = false
  SPEED_PLAYER = 4
  SPEED_BULLET = 8
  DELAY_ALIEN = 32

  SOUND_VOLUME = 0.25

  PLAYER_1_BINDINGS = {
    :left => Gosu::KB_LEFT,
    :right => Gosu::KB_RIGHT,
    :shoot => Gosu::KB_SPACE,
  }

  # Derived values
  WINDOW_X = (PIXEL_SIZE * PIXELS_X)
  WINDOW_Y = (PIXEL_SIZE * PIXELS_Y)
end
