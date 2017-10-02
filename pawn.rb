class Pawn
  attr_accessor :x_position, :y_position, :piece, :color, :counter, :firstmove, :moves
  def initialize(position,boolean) 
    @x_position = position[0]
    @y_position = position[1]
    @piece = boolean ? "♟" : "♙"
    @color = boolean ? "white" : "black"
    @counter = 0
    @firstmove = boolean ? +1 : -1
    @moves = boolean ?  [[-1,0],[-1,-1],[-1,+1],[-2,0]] : [[+1,0],[+1,+1],[+1,-1],[+2,0]]
  end 

  def possible_moves(board)
    move_list = Array.new
    @moves.each_with_index do |moves,index|
      x = @x_position + moves[0] 
      y = @y_position + moves[1]
      if index == 0 
        if x.between?(0,7) and y.between?(0,7)
          if board[x][y] == " "
            move_list << [x,y]
          end
        end  
      end 
      if index.between?(1,2)
        if x.between?(0,7) and y.between?(0,7)
          if board[x][y] == " "
          elsif board[x][y].color != self.color 
            move_list << [x,y]
          end
        end 
      end 
      if index == 3
        if counter == 0
          if x.between?(0,7) and y.between?(0,7)
            if board[x][y] && board[x+@firstmove][y] == " "
              move_list << [x,y] 
            end
          end 
        end  
      end 
    end 
    p move_list
    @counter +=1
  end 

end