#warns if input is not valid
class InvalidInput < StandardError
end

#warns if position is not valid
class InvalidPosition < StandardError
end

#starts the sudoku, takes input number and position
class Main

  #validates input number
  def validate_number
  end

  #gets number
  def get_number
  end

  #starts playing sudoku
  def play
  end
end

main = Main.new
main.play
