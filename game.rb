class Board

	def initialize
		@board = []
	end

	def create_code
		code = Array.new(4)
		code.map! {|x| x = rand(6)+1}
		@board << code
	end

	def code
		@board[0]
	end

	def last_guess
		@board[-1]
	end

	def feedback
		codecopy = Array.new(code)
		frequency = []
		same = 0
		present = 0
		for i in 0...last_guess.size
			same +=1 if last_guess[i] == codecopy[i]
		end
		for i in 0...last_guess.size
			if codecopy.include?(last_guess[i])
				idx = codecopy.index(last_guess[i])
				codecopy[idx] = nil
				present += 1
			end
		end
		same.times {frequency << 9}
		(present-same).times {frequency << 8}
		frequency
	end

	def populate(input)
		@board << input
	end

	def display
		puts @board[0]
		for i in (1...@board.length).step(2)
			puts "guess: #{@board[i].join(" ")}  feedback: #{@board[i+1].join(" ")}"
		end
	end
	
	def display_code
		@board[0].join(" ")
	end

	def incorrect_feedback(input)
		input.all? { |x| (7..9).include?(x) } && input.count == 4
	end

	def win?
		true if @board[-2] == code
	end
end

class Game
	attr_accessor :board

	@@guesses = 0

	def initialize(board)
		@board = board
	end

	def choose_mode
		puts "Do you want to guess the code or enter a code?"
		puts "Enter 1 to guess the code, or 2 to enter the code."
	end

	def validate_mode(mode = gets.chomp)
		while mode != "1" && mode != "2"
			puts "Sorry, please enter 1 or 2: "
			mode = gets.chomp
		end
		mode
	end

	def get_guess
		puts "\nPlease enter a guess: "
	end

	def provide_feedback
		puts "Please enter feedback: "
		feedback = gets.chomp
		feedback
	end

	def get_code
		puts "\nPlease enter a code: "
	end

	def validate(input = gets.chomp)
		while input.length != 4
			puts "Please enter 4 numbers"
			input = gets.chomp
		end 
		input
	end

	def format_input(input)
		input.split("").map! {|x| x.to_i}
	end

	def invalid_input?(input)
		input.all? { |x| (1..6).include?(x) } && input.count == 4
	end
	
	def increment_guesses
		@@guesses += 1
	end
	
	def play
		choose_mode
		if validate_mode == "1"
			board.create_code
			while @@guesses < 12 && !board.win?
				get_guess
				board.populate(format_input(validate))
				board.populate(board.feedback)
				board.display
				increment_guesses
			end
			if board.win?
				puts "\nCongrats, you guessed the code!!" 
			else 
				puts "\nYou lose!  The code is: #{board.display_code}"
			end
		else
			get_code
			board.populate(format_input(validate))
			while @@guesses < 12 && !board.win?
				board.create_code
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
game = Game.new(board = Board.new)
game.play


