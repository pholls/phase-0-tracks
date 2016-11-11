# Pseudocode: 
# Game Class
# -reader methods:
#   -guess_count
#   -is_over
# - writer method:
#   -guesses_left
# -initialize method
#   - set guess_count to zero
#   - set is_over variable to false
#     - is_over = true when user guesses the word or runs out of guesses
#       - number of guesses = length of word
#     - user has as many guesses as the word is long
# - method to store a user-inputted word
#   - replace all letters with underscores
#   - guesses_left = length of word
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
# - instruct user 1 to pick a word
#   - store this word with "method to store user-inputted word"
#   - set guesses_left = length of word
# - instruct user 2 to play
#   - display the hidden word
#   - accept a guess (method to accept user guesses)
#   - display word status (method to update word's status)
# - when finished: 
#   - display congrats or taunt message (method to pring message upon end)


class Game

end