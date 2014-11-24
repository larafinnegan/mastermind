class Board

def initialize
	@board = board
end


def invalid_input?(input)
	input.all? { |x| (1..6).include?(x) } && input.count == 4
end


def incorrect_feedback(input)
	input.all? { |x| (7..9).include?(x) } && input.count == 4
end


def populate_board(input)
	input
	board << [a,b,c,d]
end






end