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

  # do we have general validation for prompt?
    # basically a method that gets passed a data type as an argument and evaluates based off of that type
  def prompt(prompt='Not quite, try again:')
    puts
    puts prompt
    puts
    gets.chomp
  end

  def new_event(seconds = 1)
    # pause(seconds)
    divider
  end
end
