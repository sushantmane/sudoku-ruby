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

class Sudoku
end
