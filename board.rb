class Board

	def initialize
		@board = []
	end

	def create_code
		code = Array.new(4)
		code.map! {|x| x = rand(6)+1}
		@board << code
	end

	def feedback
		codecopy = Array.new(@board[0])
		guess = @board[-1]
		frequency = []
		same = 0
		present = 0
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
		@board[0]
	end

	def incorrect_feedback(input)
		input.all? { |x| (7..9).include?(x) } && input.count == 4
	end

	def win?
		true if @board[-2] == @board[0]
	end
end