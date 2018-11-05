require './player'
require './question'
require './turn'

player_1 = Player.new("Player 1")
player_2 = Player.new("Player 2")
current_player = player_1

def next_player(player)
  if (player.name == "Player 1")
    return true
  else
    return false
  end
end

while current_player.lives > 0 do
  # Create new Turn for current_player
  turn = Turn.new(current_player)
  turn.problem()
  turn.check(gets.chomp)
  puts "P1: #{player_1.lives}/3 vs P2: #{player_2.lives}/3"
  puts "----- NEW TURN -----"

  # Check if current_player has no lives left
  if current_player.lives == 0
     # Change current_player to next player
    if next_player(current_player)
      current_player = player_2
    else
      current_player = player_1
    end
    puts "#{current_player.name} wins with a score of #{current_player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
    break
  end

  # Change current_player to next player
  if next_player(current_player)
    current_player = player_2
  else
    current_player = player_1
  end
end