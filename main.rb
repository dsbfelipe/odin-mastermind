require_relative 'lib/master_code'
require_relative 'lib/guess_row'
require_relative 'lib/clue_square'
require_relative 'lib/computer'

board = []

row_one = GuessRow.new
row_two = GuessRow.new
row_three = GuessRow.new
row_four = GuessRow.new
row_five = GuessRow.new
row_six = GuessRow.new
row_seven = GuessRow.new
row_eight = GuessRow.new
row_nine = GuessRow.new
row_ten = GuessRow.new
row_eleven = GuessRow.new
row_twelve = GuessRow.new

board.push(row_one, row_two, row_three, row_four, row_five, row_six, row_seven, row_eight, row_nine, row_ten,
           row_eleven, row_twelve)

puts 'You want to play as code creator or guesser?'
playing_as = gets.chomp

if playing_as == 'guesser'
  victory = false

  master_code = MasterCode.new
  master_code.code = master_code.randomize_code

  board.each do |row|
    4.times do |i|
      puts "\nInsert the color in the position #{i}"
      color = gets.chomp
      row.guess.push(color)
    end
    clue_square = ClueSquare.new
    row.clue_square = clue_square.compare(master_code.code, row.guess)
    puts "\nYour guess: #{row.guess.join(', ')}"
    puts "\nClue square: #{row.clue_square.join(', ')}"
    next unless row.clue_square.count('red') == 4

    victory = true
    puts "\nYou win! The secret code was #{master_code.code.join(', ')}"
    break
  end

  puts "\nYou lose! The secret code was #{master_code.code.join(', ')}" unless victory == true
end

if playing_as == 'creator'
  computer = Computer.new
  clue_square = ClueSquare.new
  secret_code = []

  puts 'Create your secret code (choose between four colors: blue, yellow, green, purple, orange):'
  4.times do |i|
    puts "Insert the color in the position #{i + 1}:"
    secret_code.push(gets.chomp.downcase)
  end
  puts "Your secret code is: #{secret_code.join(', ')}"

  playing = true
  attempts = 0
  guess = []

  while playing
    attempts += 1
    guess = computer.computer_guess(guess, clue_square.clues)
    puts "\nTentativa ##{attempts}: #{guess.join(', ')}"

    clue_square.compare(secret_code, guess)
    puts "Clue square: #{clue_square.clues.join(', ')}"

    if clue_square.clues.count('red') == 4
      puts "Computer wins! Your code was #{secret_code.join(', ')}"
      playing = false
    elsif attempts >= 12
      puts 'Computer could not guess in twelve tries! You win!'
      playing = false
    end
  end
end
