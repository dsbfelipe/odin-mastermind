class ClueSquare
  def initialize
    @clues = []
  end

  attr_accessor :clues

  def compare(master_code, guess_row)
    @clues = []

    master_code_copy = master_code.dup
    guess_row_copy = guess_row.dup

    guess_row.each_with_index do |guess, guess_index|
      next unless guess == master_code[guess_index]

      @clues.push('red')
      master_code_copy[guess_index] = nil
      guess_row_copy[guess_index] = nil
    end

    guess_row_copy.each do |guess|
      next if guess.nil?

      next unless master_code_copy.include?(guess)

      @clues.push('white')
      master_code_copy[master_code_copy.index(guess)] = nil
    end

    @clues
  end
end
