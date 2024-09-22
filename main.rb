require_relative 'lib/master_code'
require_relative 'lib/guess_row'
require_relative 'lib/clue_square'

victory = false

board = []

master_code = MasterCode.new
master_code.code = master_code.randomize_code

row_one = GuessRow.new
row_two = GuessRow.new
row_three = GuessRow.new
row_four = GuessRow.new
row_five = GuessRow.new
row_six = GuessRow.new
row_seven = GuessRow.new
row_eight = GuessRow.new

board.push(row_one, row_two, row_three, row_four, row_five, row_six, row_seven, row_eight)

board.each do |row|
  for i in 1..4
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
