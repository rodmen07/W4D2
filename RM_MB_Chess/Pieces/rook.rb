# require_relative "piece.rb"
# require_relative "slideable.rb"

# class Bishop < Piece
#     include Slideable

#     def initialize(color, board, pos)
#         super
#     end

#     def symbol
#         "B"
#     end

#     protected

#     def move_dirs
#         diagonal_dirs
#     end
# end

require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece
    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        "R"
    end

    protected

    def move_dirs
        horizontal_and_vertical_dirs
    end
end
