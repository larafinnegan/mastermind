class Board

	def initialize
		@board = [[],[]] 
	end
	
	def populate_code(input)
		@board.unshift(input)
	end
	
	def populate_guess(input)
		@board[1] << input
	end
	
	def populate_feedback(input)
		@board[2] << input
	end
	
	def code
		@board[0]
	end

	def last_guess
		@board[1][-1]
	end

	def feedback(input)
		codecopy = Array.new(code)
		frequency = []
		same = 0
		present = 0
		for i in 0...input.size
			same +=1 if input[i] == codecopy[i]
		end
		for i in 0...input.size
			if codecopy.include?(input[i])
				idx = codecopy.index(input[i])
				codecopy[idx] = nil
				present += 1
			end
		end
		same.times {frequency << :black}
		(present-same).times {frequency << :white}
		frequency
	end

	def display
		for i in (0...@board[1].size -1)
			puts "guess #{i+1}: #{@board[1][i].join(" ")}  feedback: #{@board[2][i].join(" ")}"
		end
	end
	
	def player_guesses
		populate_guess(input)
		populate_feedback(feedback(last_guess))
	end
	
	def display_code
		@board[0].join(" ")
	end
	
	def twelve_guesses?
		true if @board[2].length == 12
	end

	def win?
		true if @board[2][-1].all? { |x| x == :black } && (@[2][-1].length == 4)
	end
end