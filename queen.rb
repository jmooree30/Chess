class Queen
	attr_accessor :x_position, :y_position, :piece, :color, :moves
	def initialize(position,is_white) 
      @x_position = position[0]
      @y_position = position[1]
      @piece = is_white ? "♛" : "♕"
      @color = is_white ? "white" : "black"
	    @moves = []
  end 
end