module Slideable

    HORIZONTAL_AND_VERTICAL DIRS = [
        [0,-1],
        [0,1],
        [-1,0],
        [1,0]
    ].freeze

    DIAGONAL_DIRS = [
        [-1,-1],
        [-1,1],
        [1,-1],
        [1,1],
    ].freeze

    def horizontal_and_vertical_dirs
        # getter for HORIZONTAL_AND_VERTICAL DIRS
        HORIZONTAL_AND_VERTICAL
    end

    def diagonal_dirs
        # getter for DIAGONAL_DIRS
        DIAGONAL_DIRS
    end

    def moves
    end

    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
    end
end
