require_relative "requirements.rb"

class Board
  def initialize
    @rows = Array.new(8) { Array.new(8) }
    # @null_piece = NullPiece.instance
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos,val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    p "no piece at given starting position" if self[start_pos] == nil

    if self[end_pos] == nil
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]  
    elsif self[end_pos] != nil
      p "already a piece at end position"
    end
  end

end

bish = Bishop.new("black","b",[3,2])
p bish
p bish.moves