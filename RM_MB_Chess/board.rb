require_relative "requirements.rb"

class Board
  attr_reader :rows
  def initialize
    # @null_piece = NullPiece.instance
    @rows = Array.new(8) { Array.new(8) }

    @rows.each.with_index do |row, i|
      row.each_with_index do |col, j|
        if i <= 1
          self[[i, j]] = Piece.new("white", self, [i,j])
        elsif i >= 6
          self[[i, j]] = Piece.new("black", self, [i,j])
        else
          self[[i, j]] = "empty"
        end
      end
    end
    return true
  end


  def [](pos)
    row, col = pos

    if row < 0 || col < 0 || row > 7 || col > 7
      return nil
    end

    return @rows[row][col]
  end

  def []=(pos ,val)
    row, col = pos

    if row < 0 || col < 0 || row > 7 || col > 7
      p "not a valid position on board"
      return nil
    end

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


# b = Board.new()
# p b
# bish = Bishop.new("black",b,[0,0])
# puts
# puts 
# b[0,0] = bish
# p b