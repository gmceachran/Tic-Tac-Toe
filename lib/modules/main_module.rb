require_relative 'utils_module'

module MainInterface
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
      selection = try_again
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


  def x_or_o
    puts "Player 1, enter 'x' or 'o' to choose your token:"
    puts
    token_choice = gets.chomp

    until token_choice == 'x' || token_choice == 'o'
      token_choice = try_again
    end

    player2 = token_choice == 'x' ? 'o' : 'x'
    { player1: token_choice, player2: player2 }
  end
  
  def another_game
    pause
    puts 'Play again? (y / n)'
    answer = gets.chomp

    until answer == 'y' || answer == 'n'
      answer = try_again
    end
    answer == 'y'
  end
end
