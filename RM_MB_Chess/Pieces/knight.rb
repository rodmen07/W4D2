require_relative 'stepable.rb'

class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        "N"
    end

    protected

    def move_diffs
        KNIGHT_DIFFS
    end

    KNIGHT_DIFFS = [
        [-2, -1],
        [-2, 1],
        [-1, -2],
        [-1, 2],
        [1, -2],
        [1, 2],
        [2, -1],
        [2, 1]
    ].freeze
end
