DISPLACEMENTS = [
  [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]
]

def inside_board?(square)
  (0..7).cover?(square[0]) && (0..7).cover?(square[1])
end

def algebraic(square)
  column = ('a'.ord + square[0]).chr
  row = square[1] + 1

  "#{column}#{row}"
end

def jumps(square)
  DISPLACEMENTS.filter_map do |dx, dy|
    jump = [square[0] + dx, square[1] + dy]
    jump if inside_board?(jump)
  end
end

def knight_moves(origin, target)
  
end
