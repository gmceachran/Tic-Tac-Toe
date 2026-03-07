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
    selection = prompt('Try selecting the middle square. Type the matching coordinates into the terminal:')
    until selection == 'b2'
      selection = prompt
    end
    puts
    puts "Great job! You're ready to play."
  end

  def intro
    welcome
    instructions
    divider
    pause(2)
  end


  def x_or_o
    token_choice = prompt("Player 1, enter 'x' or 'o' to choose your token:")

    until token_choice == 'x' || token_choice == 'o'
      token_choice = prompt
    end

    player2 = token_choice == 'x' ? 'o' : 'x'
    { player1: token_choice, player2: player2 }
  end
  
  def another_game
    pause
    answer = prompt('Play again? (y / n)')

    until answer == 'y' || answer == 'n'
      answer = prompt
    end
    answer == 'y'
  end
end
