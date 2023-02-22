# require_relative 'piece.rb'


class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    super
    @symbol = :B
    @directions = DIAGONAL_DIRS + HORIZONTAL_DIRS
  end

  private 
  attr_accessor :directions
  # def move_dirs
  #   @move_dirs = #diagonal
  # end
end

# class Rook < Piece
#   include Slideable

#   def initialize(color, board, pos)
#     super
#     @symbol = :R
#     private 
#     @move_dirs = #vertical/horizontal
#   end

  
# end



# class Queen < Piece
#   include Slideable

#   def initialize(color, board, pos)
#     super
#     @symbol = :R
#   end

#   private 
#   def move_dirs
#     @move_dirs = #vertical/horizontal, diagonal
#   end
# end