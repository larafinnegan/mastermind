require '.\ai'

class Board

attr_accessor :board

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
		@board = [[],[]] 
	end
	
	def map_to_color(input)
		input.map! {|x| @@colors.key(x)}
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

	def display
		for i in (0...@board[1].size-1)
			puts "guess #{i+1}: #{@board[1][i].join(" ")}  feedback: #{@board[2][i].join(" ")}"
		end
	end
	
	def player_guesses(input)
		populate_guess(map_to_color(input))
		populate_feedback(feedback)
		display
	end
	
	def display_code
		@board[0].join(" ")
	end
	
	def twelve_guesses?
		true if @board[2].length == 12
	end

	def win?
		true if @board[2][-1].all? { |x| x == :black } && (@board[2][-1].length == 4)
	end
end
board = Board.new