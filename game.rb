require '.\board'
require '.\ai'

class Game

			@@colors = {red: "1",
				orange: "2",
				yellow: "3",
				green: "4",
				blue: "5",
				purple: "6",
				white: "8",
				black: "9"
				}
				
	attr_accessor :board, :ai

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
		map_to_color(guess)
		guess
	end	

	def provide_feedback
		puts "Please enter feedback: "
		feedback = gets.chomp.split("")
		while (guess - ("8".."9").to_a != [])
			puts "Invalid input.  Please enter only combinations of 8 and/or 9:"
			feedback = gets.chomp.split("")
		end 
		map_to_color(feedback)
		feedback
	end

	def get_code
		puts "\nPlease enter a code: "
		code = gets.chomp
		while code.length != 4 || (code - ("1".."6").to_a != [])
			puts "Please enter 4 numbers"
			code = gets.chomp
		end 
		code.split("").map! {|x| x.to_i}
		map_to_color(code)
		code
	end
	
	def map_to_color(input)
		input.map! {|x| @@colors.key(x)}
	end
	
	def play
		if choose_mode == "1"
			board.populate_code(ai.create_code)
			while !board.twelve_guesses? && !board.win?
				board.player_guesses(get_guess)
			end
			if board.win?
				puts "\nCongrats, you guessed the code!!" 
			else 
				puts "\nYou lose!  The code is: #{board.map_to_color(board.display_code)}"
			end
		else
			board.populate_code(get_code)
			while !board.win? && !board.twelve_guesses?
				board.populate(ai.create_code)
				puts "\nThe computer guessed: #{board.last_guess}\n"
				board.populate(provide_feedback)
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


