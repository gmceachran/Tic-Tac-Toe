require_relative 'utils_module'

module MainInterface
  include Utils
  TOP_BORDER = '╔════╦════╦════╗'
  MID_BORDER = '╠════╬════╬════╣'
  BOT_BORDER = '╚════╩════╩════╝'

  def welcome
    divider
    puts "Welcome to Tic-Tac-Toe!"
    divider
    pause(2)
  end

  def instructions(c)
    announce('This game uses a coordinate system to select slots on the tic-tac-toe board.', 3)
    puts "Here's what that looks like:"
    puts
    puts <<~BOARD
      #{TOP_BORDER}
      ║ #{c[0]} ║ #{c[1]} ║ #{c[2]} ║
      #{MID_BORDER}
      ║ #{c[3]} ║ #{c[4]} ║ #{c[5]} ║
      #{MID_BORDER}
      ║ #{c[6]} ║ #{c[7]} ║ #{c[8]} ║
      #{BOT_BORDER}
    BOARD
    puts
    pause(3)
    selection = prompt('Try selecting the middle square. Type the matching coordinates into the terminal:')
    until selection == c[4]
      selection = prompt
    end
    puts
    puts "Great job! You're ready to play."
  end

  def intro(coords)
    welcome
    instructions(coords)
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
