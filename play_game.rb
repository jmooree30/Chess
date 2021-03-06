require_relative 'board'
require_relative 'players'
require_relative 'colors'

test = Board.new
puts "Welcome to my CLI version of Chess, instructions on how to play can be found at".bold
puts "          https://www.thespruce.com/rules-of-chess-611533".bold
puts "\nEnter moves based on the x and y axis. E.g. 0,6"
puts"\nPlayer one enter your name:\n"
player1 = Players.new(gets.chomp)
puts "Player two enter your name:\n"
player2 = Players.new(gets.chomp)
puts "Would you like to load a previously saved game? y/n"
load_game = gets.chomp
if load_game == "y"
  puts "\e[H\e[2J"
  test.load_game
else
  puts "\e[H\e[2J"
  test.set_board
end 

test.set_board
counter = 0  
until counter > 10000
	print "Whites move\n"
	print "#{player1.name}\n"
	test.display
	test.move("white")
	  if test.check_mate("black") != true
        puts "\e[H\e[2J"
        test.display
        puts "\nYou win!"
        break
      end 
	puts "\e[H\e[2J"
	print "Blacks move\n"
	print "#{player2.name}\n"
	test.display
	test.move("black")
	if test.check_mate("white") != true
        puts "\e[H\e[2J"
        test.display
        puts "\nYou win!"
        break
    end
	puts "\e[H\e[2J"
	counter +=1
end