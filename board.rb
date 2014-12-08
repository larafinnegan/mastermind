require '.\ai'

class Board

attr_accessor :array

	def initialize(array = [[[]],[[]]])
		@array = array
	end
	
	def populate_code(input)
		array.unshift(input)
	end
	
	def populate_guess(input)
		array[1] << input
	end
	
	def populate_feedback(input)
		array[2] << input
	end
	
	def code
		array[0]
	end

	def last_guess
		array[1][-1]
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
		same.times {frequency << "B"}
		(present-same).times {frequency << "W"}
		frequency
	end
	
	public
	def display
		array[1][1..-1].each_with_index do |x, i|
			puts "guess #{i+1}: #{x.join(" ")}  feedback: #{array[2][i+1].join(" ")}"
		end
	end
	
	def player_guesses(input)
		populate_guess(input)
		populate_feedback(feedback)
		display
	end
	
	def twelve_guesses?
		true if array[2].length == 13
	end

	def win?
		true if array[2][-1].all? { |x| x == "B" } && (array[2][-1].length == 4)
	end
end