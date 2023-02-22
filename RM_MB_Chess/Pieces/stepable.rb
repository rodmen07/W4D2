module Stepable
    def moves
        possible_moves = []
        diffs = move_diffs
        diffs.each do |diff|
            dx, dy = diff
            x, y = self.pos
            new_pos = [x + dx, y + dy]
            possible_moves << new_pos if self.board[new_pos] == "E"
        end
        possible_moves
    end

    protected

    def move_diffs
        raise NotImplementedError
    end
end

# def grow_unblocked_moves_in_dir(dx, dy)
#     moves = []
#     queue = [self.pos]
#     until queue.empty?
#         next_pos = queue.shift
#         x, y = next_pos
#         new_pos = [x + dx, y +dy]
#         # validate nothing in that space, pos is on the board
#         if self.board[new_pos] == "E"
#             moves << new_pos
#         else
#             break
#         end
#         queue << new_pos
#         # eventually add logic for capturing opponent
#     end
#     moves
# end
