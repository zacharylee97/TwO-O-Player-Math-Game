require './player'
require './question'
class Turn
  attr_reader :player, :question, :answer
  def initialize(player)
    @player = player
    @question = Question.new()
    @answer = @question.answer
  end
end