require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/modules/main_module'
  # general note for all modules: \' can be replaced by using "" for the string and ' inside when needed
  # get rid of the module namespacing, have one module, seperate pure output from inputoutput with comments. 
  # consider makeing a method that puts something like: close, try again, and returns a gets.chomp, and call every time this occurs. 

def play_game
  extend MainModules::Output
  extend MainModules::ReturnInput
    # extend is unconventional, consider including at the top or refactoring this into a GameRunner class
  play_again = true
  onboarding
    # consider renaming to tutorial

  while play_again 
    choices = x_or_o
      # choices could be more specific, piece assignments might be better
      # guard against unexpected data
    player1, player2 = Player.new("Player 1", choices[:player1]), Player.new("Player 2", choices[:player2])
    game = Game.new(player1, player2)
    game.player_turn until game.won? || game.cats_game?
    game.over
    play_again = another_game
      # guard against unexpected data
  end
end

play_game
