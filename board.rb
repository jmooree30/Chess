require_relative 'pawn'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'queen'
require_relative 'king'
require_relative 'colors' 

class Board 
	attr_accessor :board, :choice
	def initialize
		@board = Array.new(8){Array.new(8," ")}
		@choice = choice 
	end 

	def display
		axis = 0
		print "   0    1    2    3    4    5    6    7"
		@board.each_with_index do |row,index|
			print "\n"
			@draw = " +----+----+----+----+----+----+----+----+"
			puts @draw
			print axis
			axis +=1
			if index.even?
				row.each_with_index do|column,i|
					if i.odd?
						if column != " "
							print "|"+" #{column.piece}  ".bruno
						else  print "|"+" #{column}  ".bruno
						end
					else
						if column != " "
							print "|"+" #{column.piece}  "
						else  print "|"+" #{column}  "
						end
					end 
				end
			else
				row.each_with_index do|column,j|
					if j.even?
						if column != " "
							print "|"+" #{column.piece}  ".bruno
						else  print "|"+" #{column}  ".bruno
						end
					else   
						if column != " "
							print "|"+" #{column.piece}  "
						else  print "|"+" #{column}  "
						end
					end
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

	def error_message
		puts "\e[H\e[2J"
		display
		puts "\n"
		puts "Error: Invalid selection."
	end 

	def move_info(var,board)
		puts "\e[H\e[2J"
		display
		puts "\n#{@board[var[0].to_i][var[2].to_i].color} #{@board[var[0].to_i][var[2].to_i].class}: #{var}"
		print "Move to:"
	end  

	def get_move(board,choice,color)
		if board[choice[0].to_i][choice[2].to_i] == " "
			error_message
		elsif board[choice[0].to_i][choice[2].to_i].color != color
			error_message
		elsif board[choice[0].to_i][choice[2].to_i].possible_moves(board) == []
			print "No possible moves for selected piece."
		else
			return true
		end 
	end 


	def check_move(board,choice,moved)
		test = [moved[0].to_i, moved[2].to_i]
		board[choice[0].to_i][choice[2].to_i].possible_moves(board).any? do |check|
			test == check
		end 
	end 

	def swap_pieces(moved,board,choice)
		board[moved[0].to_i][moved[2].to_i] = board[choice[0].to_i][choice[2].to_i]
		board[choice[0].to_i][choice[2].to_i] = " "
		board[moved[0].to_i][moved[2].to_i].x_position = moved[0].to_i
		board[moved[0].to_i][moved[2].to_i].y_position = moved[2].to_i
	end

	def castle_white_ss(choice, moved, board)
		if choice == "7,4" 
			if moved == "7,6"
				if board[7][4].counter == 0
					if board[7][7].counter == 0 
						if board[7][6] && board[7][5] == " "
							board[7][5] = board[7][7]
							board[7][6] = board[7][4]
							board[7][4] = " "
							board[7][7] = " "
							return true
						end
					end
				end
			end
		end
	end 

	def castle_black_ss(choice, moved, board)
		if choice == "0,4"
			if moved == "0,6"
				if board[0][4].counter == 0
					if board[0][7].counter == 0
						if board[0][6] && board[0][5] == " "
							board[0][5] = board[0][7]
							board[0][6] = board[0][4]
							board[0][4] = " "
							board[0][7] = " "
							return true
						end
					end 
				end 
			end 
		end 
	end 

	def castle_white_ls(choice, moved, board)
		if choice == "7,4" 
			if moved == "7,2"
				if board[7][4].counter == 0
					if board[7][0].counter == 0 
						if board[7][1] && board[7][2] == " "
							if board[7][3] == " "
								board[7][3] = board[7][0]
								board[7][2] = board[7][4]
								board[7][4] = " "
								board[7][0] = " "
								return true 
							end
						end 
					end
				end
			end
		end
	end 


	def castle_black_ls(choice, moved, board)
		if choice == "0,4" 
			if moved == "0,2"
				if board[0][4].counter == 0
					if board[0][0].counter == 0 
						if board[0][1] && board[0][2] == " "
							if board[0][3] == " "
								board[0][3] = board[0][0]
								board[0][2] = board[0][4]
								board[0][4] = " "
								board[0][0] = " "
								return true
							end 
						end 
					end
				end
			end
		end
	end 

	def move(color)
		loop do 
			print "\nSelect a piece to move: "
			@choice = gets.chomp 
			if get_move(@board,@choice,color) == true 
				move_info(@choice,@board)
				moved = gets.chomp 
				if castle_black_ls(@choice, moved, @board) == true
					break 
				elsif castle_white_ls(@choice, moved, @board) == true
					break
				elsif castle_black_ss(@choice, moved, @board) == true
					break
				elsif castle_white_ss(@choice, moved, @board) == true 
					break
				elsif check_move(@board,@choice,moved) == true 
					swap_pieces(moved,@board,@choice)
					break
				else
					error_message
				end
			end 
		end 
	end  


end 
#