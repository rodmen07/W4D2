module Slideable

    HORIZONTAL_AND_VERTICAL DIRS = [

    ].freeze

    DIAGONAL_DIRS = [

    ].freeze

    def horizontal_and_vertical_dirs
        # getter for HORIZONTAL_AND_VERTICAL DIRS
    end

    def diagonal_dirs
        # getter for DIAGONAL_DIRS
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
