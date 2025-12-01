require 'pry-byebug'

DISPLACEMENTS = [
  [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]
]

def inside_board?(square)
  square.all? { |coord| coord.between?(0, 7) }
end

def algebraic(square)
  column = ('a'.ord + square[0]).chr
  row = square[1] + 1

  "#{column}#{row}"
end

def jumps(square, avoid = [])
  return if !square
  
  DISPLACEMENTS.filter_map do |dx, dy|
    jump = [square[0] + dx, square[1] + dy]
    jump if inside_board?(jump) && !avoid.include?(jump)
  end
end

def knight_moves(origin, target)
  return if [origin, target].any? { |square| !inside_board?(square) }

  queue = [[origin]]
  visited = []
  
  loop do
    current_path = queue.shift
    current_square = current_path.last
    
    return current_path if current_square == target
    
    visited << current_square
    available_jumps = jumps(current_square, visited)

    if available_jumps && !available_jumps.empty?
      available_jumps.each do |new_square|
        queue << (current_path + [new_square])
      end
    end
  end
end
