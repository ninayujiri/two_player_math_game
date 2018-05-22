class Question
  attr_reader :answer, :num1, :num2

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end

  def create_question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def right_answer?(input)
    @answer == input
  end
end