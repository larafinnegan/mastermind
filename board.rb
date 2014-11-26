class Board

def initialize
	@board = board
end

def create_code
code = Array.new(4)
code.map! {|x| x = rand(6)+1}
end

def display_board
for i in (0...(@@guesses*2)).step(2) do
puts "guess #{((i/2)+1)}: #{board[i]}  feedback: #{board[i+1]}"
end
end


def invalid_input?(input)
	input.all? { |x| (1..6).include?(x) } && input.count == 4
end


def incorrect_feedback(input)
	input.all? { |x| (7..9).include?(x) } && input.count == 4
end


def win?
true if feedback.all? {|x| x == 9}
end







end