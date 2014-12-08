require '.\board'

class AI

	@@colors = %w(R O Y G B P)
	@@feedback = %w(B W)
	
	attr_accessor :ai

	def initialize
		@ai = ai
	end

	def create_code(board)
		code = Array.new(4)
		code.map! do |x| 
			x = rand(6)
			x = @@colors[x].to_s
		end
		board.populate_code(code)
	end
	
	def first_guess
		["R","R","O","O"]
	end
end
