DISPLACEMENTS = [
  [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]
]
Square = Struct.new(:x, :y) do
  def to_s
    column = ('a'.ord + x).chr
    row = y + 1

    "#{column}#{row}"
  end
end

def possible_jumps(square)
  jumps = []
  DISPLACEMENTS.each do |d|
    x = square.x + d[0]
    y = square.y + d[1]
    if x.between?(0, 7) && y.between?(0, 7)
      jumps << Square.new(x, y)
    end
  end

  jumps
end

possible_jumps(Square.new(7, 7)).each { |s| puts s }

def knight_moves
  
end
