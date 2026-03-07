require_relative 'modules/game_module'

class Game
  include GameInterface
  COORDS = ['a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3']
  WIN_CONDITIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(active_player, inactive_player)
    @active_player = active_player
    @inactive_player = inactive_player
    @board_state = Array.new(9, ' ')
    @cats_game = false
  end

  def cats_game?
    @cats_game
  end

  private

  def space_available?(coord)
    COORDS.include?(coord) && @board_state[COORDS.index(coord)] == ' '
  end

  def update_board_state(player, choice)
    @board_state[COORDS.index(choice)] = player.token
  end

  public

  def won?
    WIN_CONDITIONS.any? do |condition| 
      condition.all? { |i| @board_state[i] == @inactive_player.token } 
    end
  end

  def player_turn
    announce_beginning_of_turn(@active_player.name)
    render_board(@board_state)
    # pause
    chosen_slot = player_slot_choice

    until space_available?(chosen_slot)
      chosen_slot = try_again
    end

    update_board_state(@active_player, chosen_slot)
    @cats_game = true unless @board_state.any? { |cell| cell == ' ' }
    @active_player, @inactive_player = @inactive_player, @active_player
  end

  def over
    if @cats_game
      announce_draw(@board_state)
    else
      announce_win(@inactive_player.name, @board_state)
    end
  end
end
