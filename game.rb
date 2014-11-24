require '.\player'
require '.\peg'
require '.\board'

class Game

def initialize
end

guesses = %w(red orange yellow green blue purple null white black)

def generate_random_code
code = Array.new(4)
code.map! {|x| x = rand(6)+1}
puts code
end

def get_guess
puts "Please enter a 4 digit guess using numbers 1-6:"
    guess = gets.chomp.split("")
    while code.length != 4
    	puts "Please enter 4 numbers"
	    guess = gets.chomp
     end




who wants to be the guesser and who wants to create the code
	get input from user and assign other player to the opposite

randomly generate code
	or 
solicit code from user

store code in the board


get guess from user
	or 
computer generate guess

algorithms for computer generating guess
algoriths for computer generating feedback

store guess on board
store feedback on board
display board

class variable for guess = 12


feedback: human	
	human provides up to 4 feedback pegs per turn
	these are populated on the board

feedback: computer
	computer generates up to 4 feedback pegs per turn
	these are populated on the board

win if 4 black feedback pegs
else lose





end


game = Game.new
game.play