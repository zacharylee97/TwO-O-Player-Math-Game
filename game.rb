require './player'
require './question'
require './turn'

class Game
  attr_accessor :player_1, :player_2, :players, :current_player, :round
  def initialize()
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @players = [@player_1, @player_2]
    @current_player = @players[0]
    @round = 1
  end

  def next_player(current_player)
    if self.round % 2 == 0
        self.current_player = self.players[1]
    else
      self.current_player = self.players[0]
    end
  end

  def run()
    puts "----- NEW GAME ----"
    while current_player.lives > 0 do
      # Create new Turn for current_player
      puts "----- NEW TURN -----"
      turn = Turn.new(current_player)
      turn.problem()
      turn.check(gets.chomp)
      puts "P1: #{player_1.lives}/3 vs P2: #{player_2.lives}/3"
      self.round += 1

      # Check if current_player has no lives left
      if current_player.lives == 0
         # Change current_player to next player
        next_player(current_player)
        puts "#{current_player.name} wins with a score of #{current_player.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        break
      end

      # Change current_player to next player
      next_player(current_player)
    end
  end
end