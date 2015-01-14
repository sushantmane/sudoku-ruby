require './Sudoku'

#warns if input for number is not valid
class InvalidInput < StandardError
end

#warns if input for position is not valid
class InvalidPosition < StandardError
end

#starts the sudoku, takes input number and position
class Main < Sudoku

  #checks wether input number is in range or not
  def is_number_in_range?(number)
    number.between?(1, 9)
  end

  #validates input number
  def is_valid_number?(number)
    return true if is_number_in_range?(number)
    raise(InvalidInput, 'Invalid Input!')
    rescue InvalidInput => invalid_number_error
      puts invalid_number_error
    false
  end

  #gets number
  def get_number
    number = 0
    print 'enter number: '
    loop do
      number = gets.chomp.to_i
      break if is_valid_number?(number)
      print 'enter valid number: '
    end
    return number
  end

  #validates position
  def is_valid_position?(cords)
    x_cord, y_cord = cords.split
    return false if not is_valid_number?(x_cord.to_i)
    return false if not is_valid_number?(y_cord.to_i)
    true
  end

  #gets position to insert number
  def get_position
    puts 'enter position: '
    loop do
      cords = gets.chomp
      return cords if is_valid_position?(cords)
      puts "enter valid position: "
    end
  end

  #starts playing sudoku
  def play
    number = get_number
    cords = get_position
  end
end

main = Main.new
main.play
