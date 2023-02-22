require_relative "requirements.rb"

class Board
  attr_reader :rows
  def initialize
    # @null_piece = NullPiece.instance
    @rows = Array.new(8) { Array.new(8) }

    @rows.each.with_index do |row, i|
      row.each_with_index do |col, j|
        if i <= 1
          self[i, j] = Piece.new("white", self, [i,j])
        elsif i >= 6
          self[i, j] = Piece.new("black", self, [i,j])
        else
          self[i, j] = nil
        end
      end
    end
    return true
  end


  def [](row, col)
    return @rows[row][col]
  end

  def []=(row, col ,val)
    @rows[row][col] = val
    return @rows[row][col]
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == nil
      p "no piece at given starting position"
    end
    if self[end_pos] == nil
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    elsif self[end_pos] != nil
      p "already a piece at end position"
    end
    return self[[row, col]]
  end

end
