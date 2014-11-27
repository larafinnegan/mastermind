require '.\board'

class Game

	@@guesses = 0

	def initialize(board)
		@board = board
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
		guess.split("").map! {|x| x.to_i}
	end

	def invalid_input?(input)
		input.all? { |x| (1..6).include?(x) } && input.count == 4
	end
	
	def increment_guesses
		@@guesses += 1
	end
	
	def play
		@board.create_code
		while @@guesses < 12 && !@board.win?
			get_guess
			@board.populate(format_guess(validate_guess))
			@board.populate(@board.feedback)
			@board.display
			increment_guesses
		end
		if @board.win?
			puts "Congrats, you guessed the code!!" 
		else 
			puts "You lose!  The code is: #{@board.display_code.join(" ")}"
		end
	end
end
game = Game.new(board = Board.new)
game.play


