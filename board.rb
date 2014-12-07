require '.\ai'

class Board

attr_accessor :array

			@@colors = {Red: "1",
				Orange: "2",
				Yellow: "3",
				Green: "4",
				Blue: "5",
				Purple: "6",
				White: "8",
				Black: "9"
				}

	def initialize(array = [[[]],[[]]])
		@array = array
	end
	
	def map_to_color(input)
		input.map! {|x| @@colors.key(x)}
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

	private
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
		same.times {frequency << :Black}
		(present-same).times {frequency << :White}
		frequency
	end
	
	public
	def display
	puts code
		array[1][1..-1].each_with_index do |x, i|
			puts "guess #{i+1}: #{x.join(" ")}  feedback: #{array[2][i+1].join(" ")}"
		end
	end
	
	def player_guesses(input)
		populate_guess(map_to_color(input))
		populate_feedback(feedback)
		display
	end
	
	def twelve_guesses?
		true if array[2].length == 13
	end

	def win?
		true if array[2][-1].all? { |x| x == :Black } && (array[2][-1].length == 4)
	end
end