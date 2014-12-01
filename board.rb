class Board

	@@colors = {red: "1",
				orange: "2",
				yellow: "3",
				green: "4",
				blue: "5",
				purple: "6",
				white: "8",
				black: "9"
				}

	def initialize
		@board = [] 
	end

	def code
		@board[0]
	end

	def last_guess
		@board[-1]
	end
	
	def map_to_color(input)
		input.map! {|x| @@colors.key(x)}
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
		same.times {frequency << :black}
		(present-same).times {frequency << :white}
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

	def win?
		true if @board[-1] == [:black, :black, :black, :black]
	end
end