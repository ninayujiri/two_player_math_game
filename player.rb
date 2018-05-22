class Player
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def dead?
    @lives == 0
  end

  def wrong_answer
    @lives -= 1
  end

  def summary
    "#{@name.upcase}: #{@lives}/3"
  end
end