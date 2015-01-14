#pretends change in default positions
class InvalidPositionChange < StandardError
end

#warns if number to be inserted is present in row
class NumberAlreadyInRow < StandardError
end

#warns if number to be inserted is present in column
class NumberAlreadyInColumn < StandardError
end

#warns if number to be inserted is present in subgrid
class NumberAlreadyInSubgrid < StandardError
end

#Sudoku class provides methods to insert number in grid and validate the grid
class Sudoku
  attr_reader :default_positions
  def initialize
    @grid = [[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', 9, 3, 6, 2, 8, 1, 4, ' '],
    [' ', 6, ' ', ' ', ' ', ' ', ' ', 5, ' '],
    [' ', 3, ' ', ' ', 1, ' ', ' ', 9, ' '],
    [' ', 5, ' ', 8, ' ', 2, ' ', 7, ' '], 
    [' ', 4, ' ', ' ', 7, ' ', ' ', 6, ' '],
    [' ', 8, ' ', ' ', ' ', ' ', ' ', 3, ' '],
    [' ', 1, 7, 5, 9, 3, 4, 2, ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']]

    @default_positions = get_default_positions
  end

  #gets default positions
  def get_default_positions
    default_pos = {}
    @grid.each_with_index do |arr, row_num|
      arr.each_with_index do |num, col_num|
        default_pos[[row_num, col_num]] = " " if num.is_a? String
      end
    end
    default_pos
  end

  #display grid
  def display_grid()
    @grid.each do |row|
      puts "+-----------+-----------+-----------+"
      row.each_with_index do |num, y_index|
        print "| " + num.to_s + " "
      end
      puts "|"
    end
    puts "+-----------+-----------+-----------+"
  end

  #checks if number is present in row
  def is_present_in_row?(number, cords)
    row = get_row(cords)
    row.include? number
  end

  #checks if number is present in column
  def is_present_in_column?(number, cords)
    column = get_column(cords)
    column.include? number
  end

  #checks if number is present in subgrid
  def is_present_in_subgrid?(number, cords)
    subgrid = get_subgrid(cords)
    subgrid.include? number
  end

  #gets row for given cords from grid
  def get_row(row_num)
    @grid[row_num]
  end

  #gets column for given cords from grid
  def get_column(col_num)
    column = []
    @grid.each do |row|
      column << row[col_num]
    end
    column
  end

  #gets subgrid for given cords from grid
  def get_subgrid(cords)
    subgrid = []
    x_pos = cords[0] - cords[0] % 3
    (x_pos..x_pos + 2).each do |row_num|
      y_pos = cords[1] - cords[1] % 3
      subgrid += @grid[row_num][y_pos, 3]
    end
    subgrid
  end

  #inserts number to at position
  def insert_number(number, cords)
    puts "#{number} is present in row!" if is_present_in_row?(number, cords)
    puts "#{number} is present in column!" if is_present_in_column?(number, cords)
    puts "#{number} is present in subgrid!" if is_present_in_subgrid?(number, cords)
    @grid[cords[0]][cords[1]] = number
  end

    #validates each row
    def is_rows_valid?
      @grid.each do |arr|
        return false if not arr.uniq.length == 9
      end
      true
    end

    #validates each column
    def is_columns_valid?
      (0..8).each do |col_num|
        arr = get_column(col_num)
        return false if not arr.uniq.length == 9
      end
      true
    end

    #validates each row
    def is_subgrid_valid?
      [0, 3, 6].each do |x_cord|
        [0, 3, 6].each do |y_cord|
          arr = get_subgrid([x_cord, y_cord])
          return false if not arr.uniq.length == 9
        end
      end
      true
    end

  #checks if entire grid is satisfying all conditions
  def is_solved?
    return false unless is_rows_valid?
    return false unless is_columns_valid?
    return false unless is_subgrids_valid?
    true
  end
end

sudoku = Sudoku.new
sudoku.display_grid
sudoku.is_rows_valid?
