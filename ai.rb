
class AI

	def create_code
		code = Array.new(4)
		code.map! do |x| 
			x = rand(6) + 1
			x.to_s
		end
	end
	
	def first_guess
		[:red, :red, :orange, :orange]
	end
	
	
end