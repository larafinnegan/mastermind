require '.\board'
require '.\ai'

class Game

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
		guess = gets.chomp.split("")
		until guess.length == 4 && (guess - ("1".."6").to_a == [])
			puts "Invalid input.  Please enter 4 numbers between 1 and 6:"
			guess = gets.chomp.split("")
		end 
		guess
	end	

	def provide_feedback
		puts "Please enter feedback: "
		feedback = gets.chomp.split("")
		until guess - ("8".."9").to_a == []
			puts "Invalid input.  Please enter only combinations of 8 and/or 9:"
			feedback = gets.chomp.split("")
		end 
		feedback
	end

	def get_code
		puts "\nPlease enter a code: "
		code = gets.chomp
		until code.length == 4 && (code - ("1".."6").to_a == [])
			puts "Please enter 4 numbers"
			code = gets.chomp
		end 
		code.split("").map! {|x| x.to_i}
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


