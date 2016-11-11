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

# Driver Code:
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


class Game
  attr_reader :guess_count, :is_over, :secret_word, :hidden_word
  attr_accessor :guesses_left

  def initialize
    @guess_count = 0
    @is_over = false
  end

  def hide_word(string)
    @hidden_word = string.downcase.tr('a-z', '_')
  end

end
