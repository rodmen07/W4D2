require_relative "requirements.rb"

class Board
  attr_reader :rows
  def initialize
    np = NullPiece.instance()
    @rows = Array.new(8) { Array.new(8) }

    @rows.each.with_index do |row, i|
      row.each_with_index do |col, j|
        if i == 1
          self[[i, j]] = Pawn.new("white", self, [i,j])
        elsif i == 6
          self[[i, j]] = Pawn.new("black", self, [i,j])
        else
          self[[i, j]] = np
        end
      end
      self.add_pieces("white")
      self.add_pieces("black")
    end
    return true
  end

  def add_pieces(color)
    row = 0 if color == "white"
    row = 7 if color == "black"

    p1 = Rook.new(color, self, [row, 0])
    p2 = Rook.new(color, self, [row, 7])
    self[[row, 0]] = p1
    self[[row, 7]] = p2

    p1 = Knight.new(color, self, [row, 1])
    p2 = Knight.new(color, self, [row, 6])
    self[[row, 1]] = p1
    self[[row, 6]] = p2

    p1 = Bishop.new(color, self, [row, 2])
    p2 = Bishop.new(color, self, [row, 5])
    self[[row, 2]] = p1
    self[[row, 5]] = p2

    self[[0,3]] = King.new("white", self, [0,3])
    self[[7,3]] = King.new("black", self, [7,3])
    self[[0,4]] = Queen.new("white", self, [0,4])
    self[[7,4]] = Queen.new("black", self, [7,4])
  end

  def render
    @rows.each.with_index do |row, i|
      row.each_with_index do |col, j|
        print @rows[i][j]
        print " "
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

    if piece.is_a?(NullPiece)
      p "no piece at given starting position"
      self.render
      return false
    elsif piece.moves.include?(end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
      self[end_pos].pos = end_pos
    else
      p "invalid destination for piece"
      self.render
      return false
    end
    self.render
    return true
  end
end


b = Board.new()
b.render

# b.move_piece([2,2], [0,0])
# puts
# b.move_piece([2,2], [2,3])
# b.render
# b.move_piece([5,4], [0,0])
# puts
# b.move_piece([5,4], [3,3])
# b.render
# p b[[1,0]]
# b_1 = b[[1,0]]
# p b_1.moves
# b.render
# b.move_piece([1,0],[3,2])
# puts
# b.render
# puts
# b.move_piece([3,2],[3,5])
# puts
# b.render
# puts
# puts "move from 5,5 to 5,0"
# b.move_piece([5,5],[5,0])
# b.render
# puts
# puts "move from 5,0 to 3,3"
# b.render
# b.move_piece([5,0],[3,3])

# r1 = Rook.new("white",self,[0,0])
# r2 = Rook.new("white",self,[5,5])
# self[[0,0]] = r1
# self[[5,5]] = r2
# q = Queen.new("black",self,[2,2])
# self[[2,2]] = q

# n = Knight.new("black", self, [5, 4])
# self[[5,4]] = n

# k = King.new("black",self,[2,2])
# self[[2,2]] = k


# self[[6,3]] = np

# puts "valid moves for king"
# puts
# p k.moves
# puts

# Test logic for rook/queen/knight
# puts "valid moves for r1"
# puts
# p r1.moves
# puts
# puts "valid moves for r2"
# p r2.moves
# puts

# puts "valid moves for q"
# p q.moves
# p q.moves.length
# puts

# puts "valid moves for knight"
# puts
# p n.moves
# puts
