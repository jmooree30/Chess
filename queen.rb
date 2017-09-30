class Queen
  attr_accessor :x_position, :y_position, :piece, :color, :moves
  def initialize(position,boolean) 
    @x_position = position[0]
    @y_position = position[1]
    @piece = boolean ? "♛" : "♕"
    @color = boolean ? "white" : "black"
    @moves = [[+1,0],
    [-1,0],
    [0,+1],
    [0,-1],
    [+1,-1],
    [+1,+1],
    [-1,-1],
    [-1,+1]]
  end 

  def possible_moves(board)
    move_list = Array.new
    @moves.each do |moves|
      x = @x_position
      y = @y_position
      loop do  
        x += moves[0]
        y += moves[1]
        if x.between?(0,7) == false
          break 
        elsif y.between?(0,7) == false
          break 
        elsif board[x][y] == " "
          move_list << [x,y]
        elsif board[x][y].color == self.color
          break
        else board[x][y].color != self.color
          move_list << [x,y]
          break
        end
      end  
    end 
    p move_list
  end 


end