require 'singleton'
# require_relative 'piece.rb'

class NullPiece < Piece
  # include Singleton
  def initialize()
    @color = nil
    @symbol = :N
  end

  def moves
  end
  attr_reader :symbol, :color
end

# NullPiece.new
# p NullPiece.instance