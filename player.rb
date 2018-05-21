class Player
  def initialize(name, lives)
    @name = name
    @lives = 3
  end

  def wrong_answer
    @lives - 1
  end

  def dead?
    @lives <= 0
  end

  def summary
    "#{name} has #{lives} lives left"
  end
end