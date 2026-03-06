require_relative 'utils_module'

module MainModules
  module Output
    include Utils

    def welcome
      divider
      puts "Welcome to Tic-Tac-Toe!"
      divider
      pause(2)
    end

    def instructions
      announce('This game uses a coordinate system to select slots on the tic-tac-toe board.', 3)

      puts "Here's what that looks like:"
      puts
      puts <<~BOARD
        ╔════╦════╦════╗
        ║ a1 ║ a2 ║ a3 ║
        ╠════╬════╬════╣
        ║ b1 ║ b2 ║ b3 ║
        ╠════╬════╬════╣
        ║ c1 ║ c2 ║ c3 ║
        ╚════╩════╩════╝
      BOARD

      puts
      pause(3)

      puts 'Try selecting the middle square. Type the matching coordinates into the terminal:'
      puts
      selection = gets.chomp

      until selection == 'b2'
        puts
        try_again
        selection = gets.chomp
      end

      puts
      puts "Great job! You're ready to play."
    end

    def onboarding
      welcome
      instructions
      divider
      pause(2)
    end
  end

  module ReturnInput
    include Utils

    def x_or_o
      token_choice = ''

      until token_choice == 'x' || token_choice == 'o'
        puts "Player 1, enter 'x' or 'o' to choose your token:"
        puts
        token_choice = gets.chomp
      end

      player2 = token_choice == 'x' ? 'o' : 'x'
      { player1: token_choice, player2: player2 }
    end
  
    def another_game
      answer = ''
      pause
      until answer == 'y' || answer == 'n'
        puts 'Play again? (y / n)'
        answer = gets.chomp
      end
      answer == 'y'
    end
  end
end
