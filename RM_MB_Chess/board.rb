require_relative "requirements.rb"

class Board
  attr_reader :rows
  def initialize
    # @null_piece = NullPiece.instance
    @rows = Array.new(8) { Array.new(8) }

    @rows.each.with_index do |row, i|
      row.each_with_index do |col, j|
        if i <= 1
          self[[i, j]] = Bishop.new("white", self, [i,j])
        elsif i >= 6
          self[[i, j]] = Bishop.new("black", self, [i,j])
        else
          # TODO: replace with NullPiece
          self[[i, j]] = "E"
        end
      end
    end
    return true
  end

  def render
    @rows.each.with_index do |row, i|
      row.each_with_index do |col, j|
        print @rows[i][j].to_s + " "
      end
      puts
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
    # TODO: replace with NullPiece
    if self[start_pos] == "E"
      p "no piece at given starting position"
    end
    # TODO: replace with NullPiece
    if self[end_pos] == "E"
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    else
      p "already a piece at end position"
    end
    return self[end_pos]
  end

end


b = Board.new()
b.render
p b[[1,0]]
b_1 = b[[1,0]]
p b_1.moves
b.render
b.move_piece([1,0],[3,2])
puts
b.render