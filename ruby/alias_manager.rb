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

def split_name(string)
  first_name = change_letters(string.split(' ')[1].downcase)
  last_name = change_letters(string.split(' ')[0].downcase)
  first_name.capitalize + " " + last_name.capitalize
end

all_aliases = Hash.new

puts "Welcome to the ALIAS GENERATOR 3000(R)
Enter your first and last name to receive an Official Secret Agent Alias (C).
(Type 'quit' when finished.)"
user_name = gets.chomp

loop do
  if user_name.downcase == "quit"
    break
  elsif user_name == ""
    puts "Invalid input. Try again."
    user_name = gets.chomp
  else
    p split_name(user_name)
    all_aliases[user_name] = split_name(user_name)
    puts "Enter another name (or 'quit')."
    user_name = gets.chomp
  end
end

all_aliases.each { |key, value| puts "#{value} is really #{key}"}
