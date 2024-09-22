class Computer
  def initialize
    @colors = %w[blue yellow green purple orange purple]
    @guess = []
  end

  def computer_guess(guess, clue_square = nil)
    if guess.empty?
      4.times do
        @guess.push(@colors[rand(0..5)])
      end
    else
      guess = what_to_keep(clue_square, guess)
      guess.each_with_index do |color, index|
        guess[index] = @colors[rand(0..5)] if color == 'empty'
      end
      @guess = guess
    end
    @guess
  end

  def what_to_keep(clue_square, guess)
    keep = %w[empty empty empty empty]
    clue_square.each_with_index do |element, index|
      keep[index] = guess[index] if element == 'red'
    end
    keep
  end
end
