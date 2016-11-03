# Pseudocode:
# Get name input
# Convert name to 2-item array ["Firstname", "Lastname"] with .split(' ')
# Swap the order of Firstname and Lastname (.reverse)
# Make all letters lower case (ignore case sensitivity with .downcase)
# Break the name into individual letters (or use .each_char)
# Determine if each letter is a vowel or a consonant
#   Compare all vowels to "aeiou"
#     Change every vowel to the next one in line ("a" => "e")
#     Protect edge case so "u" => "a"
#   Compare all consonants to the string "bcdfghjklmnpqrstvwxyz"
#     Change every consonant to the next one in line ("b" => "c", "d" => "f")
#     Set up edge case protection so "z" => "b"
# Put the letters back together into two strings
# Capitalize the first letters (.capitalize)
# Append the strings together as an alias name
# Print the result

# I treat "y" as a consonant in this program
def next_vowel(vowel)
  all_vowels = "aeiou"
  if all_vowels[all_vowels.index(vowel) + 1] == nil
    all_vowels[0]
  else
    all_vowels[all_vowels.index(vowel) + 1]
  end
end

def next_consonant(consonant)
  all_consonants = "bcdfghjklmnpqrstvwxyz"
  if all_consonants[all_consonants.index(consonant) + 1] == nil
    all_consonants[0]
  else
    all_consonants[all_consonants.index(consonant) + 1]
  end
end

# Maybe this method does too much at once and is repetitive.
def change_letters(name)
  all_vowels = "aeiou"
  all_consonants = "bcdfghjklmnpqrstvwxyz"
  new_name = ""
  name.each_char do |letter|
    if all_vowels.include?(letter)
      new_name << next_vowel(letter)
    elsif all_consonants.include?(letter)
      new_name << next_consonant(letter)
    end
  end
  new_name
end

# I used .first and .last instead [0] and [1] to allow for three or more names:
# The program still only returns the first and last name as the alias.
def split_name(string)
  first_name = change_letters(string.split(' ').last.downcase)
  last_name = change_letters(string.split(' ').first.downcase)
  full_alias = first_name.capitalize + " " + last_name.capitalize
end

p split_name("Felicia Henandez Torres")
# puts "Welcome to the ALIAS GENERATOR 3000(R)
# Enter your first and last name to receive an Official Secret Agent alias (C).
# (Type 'quit' when finished.)"
# input = gets.chomp
# if input.downcase == "quit"
#   puts "Operation Complete."
# else
#   loop do puts split_name(input)
#   puts "Enter another name (or 'quit')."
#   break if input.downcase == "quit"
#   end
# end
