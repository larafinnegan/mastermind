require '.\player'
require '.\peg'
require '.\board'

class Game

def initialize
end

guesses = %w(red orange yellow green blue purple null white black)

code = Array.new(4)
code.map! {|x| x = rand(6)+1}
puts code

puts "Please enter a 4 digit guess using numbers 1-6:"
    guess = gets.chomp.split("")
    while guess.length != 4
        puts "Please enter 4 numbers"
	    guess = gets.chomp.split("")
    end
    guess.map! (&:to_i)
    

    frequency = []
    same = 0
    present = 0
    codecopy = code
    for i in 0...guess.size
        same +=1 if guess[i] == codecopy[i]
    end
    for i in 0...guess.length
        if codecopy.include?(guess[i])
            idx = codecopy.index(guess[i])
            codecopy[idx] = nil
            present += 1
        end
    end
same.times {frequency << 9}
(present-same).times {frequency << 8}


frequency



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