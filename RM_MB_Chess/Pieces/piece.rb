# require_relative "rook_bishop_queen.rb"


  def moves()
    p directions
    x_1, y_1 = self.pos
    moves = []
    directions.each do |dirs|
      x_2, y_2 = dirs
      # debugger if [x_1,x_2,y_1,y_2].any? {|c| c.nil?}
      moves << [x_1 + x_2, y_1 + y_2]
    end
  end

  def move_dirs
  end

end

module Stepable
end

class Piece
attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s()
    sym = self.board[self.pos].symbol
    return sym
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

  def Symbol
  end

  attr_reader :board
  private

end
