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
  DISPLACEMENTS.filter_map do |dx, dy|
    jump = [square[0] + dx, square[1] + dy]
    jump if inside_board?(jump) && !avoid.include?(square)
  end
end

def knight_moves(origin, target)
  return if [origin, target].any? { |square| !inside_board?(square) }

  queue = [origin]
  visited = []

  while queue
    available_jumps = jumps(queue[0], visited)
    visited << queue.shift
    #puts "Available jumps: #{available_jumps.size}"
    queue += available_jumps if !available_jumps.empty?
    #puts "Current queue: #{queue.inspect}"
    
    break if visited.last == target
  end

  visited
end
