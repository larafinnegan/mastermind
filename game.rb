require '.\player'
require '.\peg'
require '.\board'

class Game

def initialize
end

def get_guess
puts "Please enter a guess: "
end

def validate_guess(guess = gets.chomp)
    while guess.length != 4
        puts "Please enter 4 numbers"
        guess = gets.chomp
    end 
    guess
end

def format_guess(guess)
    guess.split("").map! (&:to_i)
end

def invalid_input?(input)
	input.all? { |x| (1..6).include?(x) } && input.count == 4
end

end
game = Game.new
board = Board.new
board.create_code
game.get_guess
board.populate(game.format_guess(game.validate_guess))
board.populate(board.feedback)
