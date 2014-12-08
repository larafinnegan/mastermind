require '.\board'
require '.\ai'

class Game

	@@colors = %w(R O Y G B P)
	@@feedback = %w(B W)

	attr_accessor :board, :ai

	def initialize(board, ai)
		@board = board
		@ai = ai
	end

	def choose_mode
		puts "Do you want to guess the code or enter a code?"
		puts "Enter 1 to guess the code, or 2 to enter the code."
		mode = gets.chomp
		until mode == "1" || mode == "2"
			puts "Sorry, please enter 1 or 2: "
			mode = gets.chomp
		end
		mode
	end

	def get_guess
		puts "\nPlease enter a guess: "
		guess = gets.chomp.upcase.split("")
		until guess.length == 4 && @@colors.include?(guess)
			puts "Invalid input.  Please enter 4 colors:"
			guess = gets.chomp.upcase.split("")
		end 
		guess
	end	

	def provide_feedback
		puts "Please enter feedback: "
		feedback = gets.chomp.upcase.split("")
		until feedback - @@feedback == []
			puts "Invalid input.  Please enter only combinations of 8 and/or 9:"
			feedback = gets.chomp.upcase.split("")
		end 
		feedback
	end

	def get_code
		puts "\nPlease enter a code: "
		code = gets.chomp.upcase.split("")
		until code.length == 4 && @@colors.include?(code)
			puts "Invalid input.  Please enter 4 colors:"
			code = gets.chomp.upcase.split("")
		end
		code
	end
	
	def play
		if choose_mode == "1"
			ai.create_code(board)
			until board.twelve_guesses? || board.win?
				board.player_guesses(get_guess)
			end
			if board.win?
				puts "\nCongrats, you guessed the code!!" 
			else 
				puts "\nYou lose!  The code is: #{board.code.join(" ")}"
			end
		else
			board.populate_code(get_code)
			until board.win? || board.twelve_guesses?
				board.populate_guess(ai.create_code)
				puts "\nThe computer guessed: #{board.last_guess}\n"
				board.populate_feedback(provide_feedback)
				board.display
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


