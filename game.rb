require '.\player'
require '.\peg'
require '.\board'

class Game

def initialize
end

**********
@@guesses = 0
board = []

code = Array.new(4)
code.map! {|x| x = rand(6)+1}
puts code

while @@guesses < 12
codecopy = Array.new(code)
@@guesses +=1
puts "Please enter a 4 digit guess using numbers 1-6:"
    guess = gets.chomp.split("")
    while guess.length != 4
        puts "Please enter 4 numbers"
        guess = gets.chomp.split("")
    end
    guess.map! (&:to_i)
    
    board << guess
    
    frequency = []
    same = 0
    present = 0
    puts codecopy
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


board << frequency

for i in (0...(@@guesses*2)).step(2) do
puts "guess #{((i/2)+1)}: #{board[i]}  feedback: #{board[i+1]}"
end

end

*************





end


game = Game.new
game.play