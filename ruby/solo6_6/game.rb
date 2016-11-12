# Pseudocode: 
# Game Class
# -getter methods:
#   -guess_count
#   -is_over
#   -secret_word
# - setter method:
#   -guesses_left
# -initialize method
#   - set guess_count to zero
#   - set is_over variable to false
# - method to store a user-inputted word
#   - replace all letters with underscores
#   - guesses_left = length of word
#   - is_over = true when user guesses the word or runs out of guesses
#       - number of guesses = length of word
#     - user has as many guesses as the word is long
# - method to receive user guesses (letters)
#   - check against previous guesses
#   - iterate over the string
#     - find the inputted letter
#     - if found:
#       - display on the hidden word
#       - print the hidden word
#       - if word is full: is_over = true
#     - if not found:
#       - guess_count += 1
# - method to update the word's status and display to the user
#   - display non-guessed/missing letters with underscores
#   - display guessed letters
#   - inform user how many guesses remain: length of secret word - guess_count
#   - when word is exposed, print word, and number of guesses used
# - method to print message upon end
#   - when guess_count - guesses_left == 0
#   - print taunt message if they lose


class Game
  attr_reader :guess_count, :hidden_word, :guessed_letters
  attr_accessor :guesses_left, :secret_word, :is_over

  def initialize
    @guess_count = 0
    @is_over = false
    @guessed_letters = ""
  end

  def hide_word(string)
    @guesses_left = string.length
    @hidden_word = string.downcase.tr('a-z', '_')
  end

  def check_guess(letter)
    if @secret_word.include?(letter)
      @hidden_word[@secret_word.index(letter)]= letter
      @guessed_letters << letter
    elsif @guessed_letters.include?(letter)
      puts "Guess a different letter."
    else
      @guess_count += 1
      @guesses_left -= 1
      puts "Nope, sorry!"
      @guessed_letters << letter
    end
    p @hidden_word
  end

  def end_game
    if @secret_word == @hidden_word || guesses_left == 0
      @is_over = true
    end
  end

end

#Driver Code
# - new Game instance
# - instruct user 1 to pick a word
#   - store this word with "method to store user-inputted word"
#   - set guesses_left = length of word
# - instruct user 2 to play
#   - display the hidden word
#   - accept a guess (method to accept user guesses)
#   - display word status (method to update word's status)
#   - loop while secret_word != hidden_word OR guesses_left > 0
# - when finished: 
#   - display congrats or taunt message (method to print message upon end)

puts "Welcome to the Word Game!"
game = Game.new

puts "User 1: Please input a word."
game.secret_word = gets.chomp
game.hide_word(game.secret_word)
25.times { puts }

puts "User 2: Get ready to guess!"
puts game.hidden_word
puts "You have #{game.guesses_left} guesses."
puts "Type a letter to guess:"

until game.is_over # || game.guesses_left == 0
  guess = gets.chomp.downcase
  while guess == "" || guess == " "
    puts "Guess a letter!"
    guess = gets.chomp.downcase
  end
  game.check_guess(guess)
  game.hidden_word
  puts "You have #{game.guesses_left} guesses remaining."
  game.end_game
end

if game.is_over && game.guesses_left > 0
  puts "Congratulations! You won with #{game.guesses_left} guesses left!"
else
  puts "HA! Loser! The answer was '#{game.secret_word}'!"
end
