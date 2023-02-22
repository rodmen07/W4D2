class Piece
attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    self.symbol
  end

  def empty?
  end

  def valid_moves
    return moves
  end

  def pos=(val)
  end

  def move_into_check?(end_pos)
  end

  # def Symbol
  # end

  attr_reader :board
  private

end
