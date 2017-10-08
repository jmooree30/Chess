require_relative 'board'
require_relative 'players'
require_relative 'colors'

puts "Welcome to my CLI version of Chess, instructions on how to play can be found at".bold
puts "          https://www.thespruce.com/rules-of-chess-611533".bold
puts "\nEnter moves based on the x and y axis. E.g. 0,6"
puts"\nPlayer one enter your name:\n"
player1 = Players.new(gets.chomp)
print "Player two enter your name:\n"
player2 = Players.new(gets.chomp)
puts "\e[H\e[2J"

test = Board.new
test.set_board
counter = 0

until counter > 5
	print "Whites move\n"
	print "#{player1.name}\n"
	test.display
	test.move("white")
	puts "\e[H\e[2J"
	print "Blacks move\n"
	print "#{player2.name}\n"
	test.display
	test.move("black")
	puts "\e[H\e[2J"
	counter +=1
end