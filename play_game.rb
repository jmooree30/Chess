require_relative 'board'
require_relative 'players'

print "Player one enter your name:\n"
player1 = Players.new(gets.chomp)
#player1.name = gets.chomp
print "Player two enter your name:\n"
player2 = Players.new(gets.chomp)
#player2.name = gets.chomp

test = Board.new
test.set_board
counter = 0

until counter > 5
  test.display
  print "\nWhites move"
  print "\n#{player1.name} make your move:"
  test.move("white")
  test.display
  print "\nBlacks move"
  print "\n#{player2.name} make your move:"
  test.move("black")
  counter +=1
end