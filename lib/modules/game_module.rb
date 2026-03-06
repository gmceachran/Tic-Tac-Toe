require_relative 'utils_module'

module GameModules
  module Output
    include Utils
    TOP_BORDER = '╔═══╦═══╦═══╗' 
    MID_BORDER = '╠═══╬═══╬═══╣'
    BOT_BORDER = '╚═══╩═══╩═══╝'

    def render_board(b)
      puts <<~BOARD
        #{TOP_BORDER}
        ║ #{b[0]} ║ #{b[1]} ║ #{b[2]} ║
        #{MID_BORDER}
        ║ #{b[3]} ║ #{b[4]} ║ #{b[5]} ║
        #{MID_BORDER}
        ║ #{b[6]} ║ #{b[7]} ║ #{b[8]} ║
        #{BOT_BORDER}
      BOARD
      puts
    end

    def announce_beginning_of_turn(name)
      new_event
      puts "#{name}'s turn:"
    end

    def announce_win(name, board_state)
      new_event
      puts "#{name} won!"
      puts
      render_board(board_state)
      pause
      puts 'Game over'
    end

    def announce_draw(board_state)
      new_event
      puts 'Cat\'s Game!'
      puts
      render_board(board_state)
      pause
      puts 'Game over'
    end
  end

  module ReturnInput
    include Utils

    def player_slot_choice
      puts 'Choose an empty space:'
      gets.chomp
    end
  end
end
