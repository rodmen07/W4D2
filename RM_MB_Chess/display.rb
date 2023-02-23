require_relative "board.rb"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        self.board.render
    end

    private 
    attr_accessor :board
end

b = Board.new
d = Display.new(b)
d.render