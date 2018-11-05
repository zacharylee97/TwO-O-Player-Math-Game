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

  def next_player()
    if self.round % 2 == 0
        self.current_player = self.players[1]
    else
      self.current_player = self.players[0]
    end
  end

  def new_turn(player)
    puts "----- ROUND #{self.round} -----"
      turn = Turn.new(player)
      turn.problem()
      turn.check(gets.chomp)
  end

  def game_over?(player)
    if player.lives == 0
      return true
    end
    return false
  end

  def run()
    puts "----- NEW GAME ----"
    while current_player.lives > 0 do
      # Create new Turn for current_player
      new_turn(current_player)
      puts "P1: #{player_1.lives}/3 vs P2: #{player_2.lives}/3"
      self.round += 1
      # Check if current_player has no lives left
      if game_over?(current_player)
        # Next player is declared the winner
        next_player()
        winner = current_player
        puts "#{winner.name} wins with a score of #{winner.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        break
      end
      # Change current_player to next player
      next_player()
    end
  end
end