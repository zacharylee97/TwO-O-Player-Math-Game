require './player'
require './question'
class Turn
  attr_reader :player, :question, :answer
  def initialize(player)
    @player = player
    @question = Question.new()
    @answer = @question.answer
  end
  # Print out problem for current player
  def problem()
    puts "#{self.player.name}: What does #{self.question.a} plus #{self.question.b} equal?"
    print "> "
  end
  # Check if input from player matches correct answer to question
  def check(input)
    if (input.to_i == self.answer)
      puts "#{self.player.name}: YES! You are correct."
    else
      puts "#{self.player.name}: Seriously? No!"
      self.player.lives -= 1
    end
  end
end