class Question
  attr_reader :question, :answer

  def initialize
    number1 = rand(1..20)
    number2 = rand(1..20)
    @answer = number1 + number2
    @question = "What does #{number1} + #{number2} equal? "
  end
  
end

