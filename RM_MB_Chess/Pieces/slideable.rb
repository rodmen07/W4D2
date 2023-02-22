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
            if self.board[new_pos] == "empty"
                moves << new_pos
            else
                break
            end
            queue << new_pos
            # eventually add logic for capturing opponent
        end
    end
end
