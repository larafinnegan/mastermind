require '.\board'
require '.\ai'

class Game
	attr_accessor :board, :ai

	@@guesses = 0

	def initialize(board, ai)
		@board = board
		@ai = ai
	end

	def choose_mode
		puts "Do you want to guess the code or enter a code?"
		puts "Enter 1 to guess the code, or 2 to enter the code."
		mode = gets.chomp
		while mode != "1" && mode != "2"
			puts "Sorry, please enter 1 or 2: "
			mode = gets.chomp
		end
		mode
	end

	def get_guess
		puts "\nPlease enter a guess: "
		guess = gets.chomp.split("")
		while guess.length != 4 || (guess - ("1".."6").to_a != [])
			puts "Invalid input.  Please enter 4 numbers between 1 and 6:"
			guess = gets.chomp.split("")
		end 
		guess
	end	

	def provide_feedback
		puts "Please enter feedback: "
		feedback = gets.chomp.split("")
		while (guess - ("8".."9").to_a != [])
			puts "Invalid input.  Please enter only combinations of 8 and/or 9:"
			feedback = gets.chomp.split("")
		end 
		feedback
	end

	def get_code
		puts "\nPlease enter a code: "
		code = gets.chomp
		while code.length != 4
			puts "Please enter 4 numbers"
			code = gets.chomp
		end 
		code.split("").map! {|x| x.to_i}
		code
	end
	
	def increment_guesses
		@@guesses += 1
	end
	
	def play
		if choose_mode == "1"
			board.populate(board.map_to_color(ai.create_code))
			while @@guesses < 12 && !board.win?
				board.populate(board.map_to_color(get_guess))
				board.populate(board.feedback)
				board.display
				increment_guesses
			end
			if board.win?
				puts "\nCongrats, you guessed the code!!" 
			else 
				puts "\nYou lose!  The code is: #{board.map_to_color(board.display_code)}"
			end
		else
			board.populate(get_code)
			while @@guesses < 12 && !board.win?
				board.populate(ai.create_code)
				puts "\nThe computer guessed: #{board.last_guess}\n"
				board.populate(provide_feedback)
				board.display
				increment_guesses
			end
			if board.win?
				puts "\nThe computer won!!" 
			else 
				puts "\nYou win!!"
			end
		end
	end
end
game = Game.new(board = Board.new, ai = AI.new)
game.play


