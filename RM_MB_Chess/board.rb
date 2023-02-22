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

    r1 = Rook.new("white",self,[0,0])
    r2 = Rook.new("white",self,[5,5])
    self[[0,0]] = r1
    self[[5,5]] = r2

    q = Queen.new("black",self,[2,2])
    self[[2,2]] = q

    puts "valid moves for r1"
    puts
    p r1.moves
    puts
    puts "valid moves for r2"
    p r2.moves
    puts

    puts "valid moves for q"
    p q.moves
    p q.moves.length
    puts

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
    piece = self[start_pos]

    # TODO: replace with NullPiece
    if piece == "E"
      p "no piece at given starting position"
      return false
    elsif piece.moves.include?(end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    else
      p "invalid destination for piece"
      return false
    end

    return true
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
puts
b.move_piece([3,2],[3,5])
puts
b.render
puts
puts "move from 5,5 to 5,0"
b.move_piece([5,5],[5,0])
b.render
puts
puts "move from 5,0 to 3,3"
b.render
b.move_piece([5,0],[3,3])