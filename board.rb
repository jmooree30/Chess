require_relative 'pawn'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'queen'
require_relative 'king' 

class Board 
	attr_accessor :board, :choice
	def initialize
		@board = Array.new(8){Array.new(8," ")}
		@choice = choice 
	end 

	def display
   axis = 0
   print "   0    1    2    3    4    5    6    7"
   @board.each do |row|
     print "\n"
     @draw = " +----+----+----+----+----+----+----+----+"
     puts @draw
     print axis
     axis +=1
     row.each do|column|
       if column != " "
         print "| #{column.piece}  "
       else  print "| #{column}  "
       end
      end
      print "|"
    end
    print "\n"
    print @draw
  end

	def set_board
		@board[0][0] = Rook.new([0,0],false)
		@board[0][1] = Knight.new([0,1],false)
		@board[0][2] = Bishop.new([0,2],false)
		@board[0][3] = Queen.new([0,3],false)
		@board[0][4] = King.new([0,4],false)
		@board[0][5] = Bishop.new([0,5],false)
		@board[0][6] = Knight.new([0,6],false)
		@board[0][7] = Rook.new([0,7],false)
		@board[1][0] = Pawn.new([1,0],false)
		@board[1][1] = Pawn.new([1,1],false)
		@board[1][2] = Pawn.new([1,2],false)
		@board[1][3] = Pawn.new([1,3],false)
		@board[1][4] = Pawn.new([1,4],false)
		@board[1][5] = Pawn.new([1,5],false)
		@board[1][6] = Pawn.new([1,6],false)
		@board[1][7] = Pawn.new([1,7],false)

		@board[7][0] = Rook.new([7,0],true)
		@board[7][1] = Knight.new([7,1],true)
		@board[7][2] = Bishop.new([7,2],true)
		@board[7][3] = Queen.new([7,3],true)
		@board[7][4] = King.new([7,4],true)
		@board[7][5] = Bishop.new([7,5],true)
		@board[7][6] = Knight.new([7,6],true)
		@board[7][7] = Rook.new([7,7],true)
		@board[6][0] = Pawn.new([6,0],true)
		@board[6][1] = Pawn.new([6,1],true)
		@board[6][2] = Pawn.new([6,2],true)
		@board[6][3] = Pawn.new([6,3],true)
		@board[6][4] = Pawn.new([6,4],true)
		@board[6][5] = Pawn.new([6,5],true)
		@board[6][6] = Pawn.new([6,6],true)
		@board[6][7] = Pawn.new([6,7],true)
	end 


	def move(color)
    loop do 
      @choice = gets.chomp 
      if @board[choice[0].to_i][choice[2].to_i] == " "
       p "Invalid move, please try again."
     elsif @board[choice[0].to_i][choice[2].to_i].color != color
       p "Invalid move, please try again."
     elsif @board[choice[0].to_i][choice[2].to_i].color == color
       puts "\e[H\e[2J"
       display
       puts "\n#{@board[@choice[0].to_i][@choice[2].to_i].color} #{@board[@choice[0].to_i][@choice[2].to_i].class}: #{@choice}"
       puts "Possible moves:"

       if @board[@choice[0].to_i][@choice[2].to_i].possible_moves(@board) == []
        puts "No possible moves, please try a different piece."
       elsif
       moved = gets.chomp
       @board[moved[0].to_i][moved[2].to_i] = @board[@choice[0].to_i][@choice[2].to_i]
       @board[@choice[0].to_i][@choice[2].to_i] = " "
       @board[moved[0].to_i][moved[2].to_i].x_position = moved[0].to_i
       @board[moved[0].to_i][moved[2].to_i].y_position = moved[2].to_i 
       break
     end 
     end 
   end 
 end 

end 


