class Piece
  attr_accessor :board, :color, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    self.symbol
  end

  def valid_moves
    return moves
  end

  # def move_into_check?(end_pos)
  # end

end
