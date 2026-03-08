module Utils
  BORDER = "======================================"

  def divider
    puts
    puts BORDER
    puts
  end

  def pause(seconds = 1)
    sleep(seconds)
  end

  def announce(message, seconds)
    puts message
    puts
    pause(seconds)
  end

  def prompt(prompt='Not quite, try again:')
    puts
    puts prompt
    gets.chomp
  end

  def new_event(seconds = 1)
    pause(seconds)
    divider
  end
end
