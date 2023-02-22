# class Bishop < Piece
#     include Slideable

#     def initialize(color, board, pos)
#       super
#       @symbol = :B
#       @directions = DIAGONAL_DIRS + HORIZONTAL_DIRS
#     end

#     private
#     attr_accessor :directions
#     def move_dirs
#       @move_dirs = diagonal
#     end
#   end

require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        "B"
    end

    protected

    def move_dirs
        diagonal_dirs
    end
end
