module Slideable

    HORIZONTAL_AND_VERTICAL_DIRS = [
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
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        # getter for DIAGONAL_DIRS
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        dirs = move_dirs
        dirs.each do |dir|
            x, y = dir
            possible_moves += grow_unblocked_moves_in_dir(x, y)
        end
        possible_moves
    end

    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        queue = [self.pos]
        until queue.empty?
            next_pos = queue.shift
            x, y = next_pos
            new_pos = [x + dx, y +dy]
            # validate nothing in that space, pos is on the board
            # TODO: replace with NullPiece
            if self.board[new_pos].is_a?(NullPiece)
                moves << new_pos
            else
                break
            end
            queue << new_pos
            # eventually add logic for capturing opponent
        end
        moves
    end
end
