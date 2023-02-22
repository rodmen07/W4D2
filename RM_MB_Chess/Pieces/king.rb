require_relative 'stepable.rb'

class King < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        "K"
    end

    protected

    def move_diffs
        KING_DIFFS
    end

    KING_DIFFS = [
        [0, 1],
        [0, -1],
        [1, 0],
        [1, 1],
        [1, -1],
        [-1, 0],
        [-1, 1],
        [-1, -1]
    ].freeze
end
