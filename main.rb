require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/modules/main_module'
include MainInterface

def play_game
  play_again = true
  intro(Game::COORDS)

  while play_again 
    token_choices = x_or_o
    player1, player2 = Player.new("Player 1", token_choices[:player1]), Player.new("Player 2", token_choices[:player2])
    game = Game.new(player1, player2)
    game.player_turn until game.won?(game.inactive_player) || game.cats_game?
    game.over
    play_again = another_game
  end
end

play_game
