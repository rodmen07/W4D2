class Pawn < Piece

    def initialize(color, board, pos)
        super
    end

    def symbol
        "P"
    end

    def moves
        possible_moves = []
        dirs = self.forward_dir
        x, y = self.pos
        dirs.each do |dir|
            dx, dy = dir
            new_pos = [x + dx, y + dy]
            possible_moves << new_pos if self.board[new_pos].is_a(NullPiece)
        end
        return possible_moves
    end

    protected

    def at_start_row?
        r, c = self.pos
        if (self.color == "white" && r == 1) || (self.color == "black" && r == 6)
            return true
        else
            return false
        end
    end

    def forward_dir
        forward_dirs = []
        if self.color == "white" && self.at_start_row?
            forward_dirs << [1,0]
            forward_dirs << [2,0]
        elsif self.color == "white"
            forward_dirs << [1,0]
        elsif self.color == "black" && self.at_start_row?
            forward_dirs << [-1,0]
            forward_dirs << [-2,0]
        elsif self.color == "black"
            forward_dirs << [-1,0]
        end
        return forward_dirs
    end
    
end
