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

  # add gets.chomp, consider renaming to return correct value or something similar
  def try_again
    puts 'Not quite, try again:'
  end

  def new_event(seconds = 1)
    pause(seconds)
    divider
  end
end
