require '.\board'

class AI
	
	attr_accessor :ai

	def initialize
		@ai = ai
	end

	def create_code(board)
		code = Array.new(4)
		code.map! do |x| 
			x = rand(6) + 1
			x.to_s
		end
		board.populate_code(board.map_to_color(code))
	end
	
	def first_guess
		[:Red, :Red, :Orange, :Orange]
	end
end
