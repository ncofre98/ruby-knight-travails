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

def jumps(square)
  DISPLACEMENTS.filter_map do |dx, dy|
    x = square.x + dx
    y = square.y + dy
    Square.new(x, y) if (0..7).cover?(x) && (0..7).cover?(y)
  end
end

def knight_moves(origin, target)
end
