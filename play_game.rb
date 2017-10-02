require_relative 'board'
require_relative 'players'

puts "Welcome to my CLI version of Chess, instructions on how to play can be found at"
puts "          https://www.thespruce.com/rules-of-chess-611533"
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
	test.display
	print "\nWhites move"
	print "\n#{player1.name} select a piece to move:"
	test.move("white")
	puts "\e[H\e[2J"
	test.display
	print "\nBlacks move"
	print "\n#{player2.name} select a piece to move:"
	test.move("black")
	puts "\e[H\e[2J"
	counter +=1
end