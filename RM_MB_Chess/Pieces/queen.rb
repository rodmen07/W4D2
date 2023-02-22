require_relative "piece.rb"
require_relative "slideable.rb"

class Queen < Piece
    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        "Q"
    end

    protected

    def move_dirs
        diagonal_dirs + horizontal_and_vertical_dirs
    end
end
