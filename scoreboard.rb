class Scoreboard
  def initialize
    @score = 0
    @font = Gosu::Font.new(12)
    @highscore = 0
    EventHandler.register_listener(:bullet_hit, self, :increment)
  end

  def reset
    @score = 0
  end

  def increment(context)
    @score += 1
    @highscore =[@score, @highscore].max
  end

  def draw
    @font.draw_text(
      "Score: #{@score}", 
      5,
      5,
      1,
    )
    @font.draw_text_rel(
      "Highscore: #{@highscore}",
      Config::WINDOW_X - 5,
      5,
      1,
      1,
      0,
    )
  end
end