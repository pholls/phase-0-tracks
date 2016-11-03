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

def next_vowel(vowel)
  all_vowels = ["a", "e", "i", "o", "u"]
  if all_vowels[all_vowels.index(vowel) + 1] == nil
    all_vowels[0]
  else
    all_vowels[all_vowels.index(vowel) + 1]
  end
end

# Driver code:
# p next_vowel("a")
# p next_vowel("e")
# p next_vowel("i")
# p next_vowel("o")
# p next_vowel("u")

def next_consonant(consonant)
all_consonants = "bcdfghjklmnpqrstvwxyz"
  if all_consonants[all_consonants.index(consonant) + 1] == nil
    all_consonants[0]
  else
    all_consonants[all_consonants.index(consonant) + 1]
  end
end

# Driver code:
# p next_consonant("b")
# p next_consonant("d")
# p next_consonant("f")
# p next_consonant("g")
# p next_consonant("h")
# p next_consonant("j")
# p next_consonant("z")
# p next_consonant("l")
# p next_consonant("m")

def iterate(name)
  all_vowels = ["a", "e", "i", "o", "u"]
  all_consonants = "bcdfghjklmnpqrstvwxyz"
  changed_name = ""
  name.each_char do |letter|
    if all_vowels.include?(letter)
      changed_name << next_vowel(letter)
    elsif all_consonants.include?(letter)
      changed_name << next_consonant(letter)
    end
  end
  changed_name
end

p iterate("pat")

# name_array = input.split(' ')
# Firstname = name_array[0].downcase
# Lastname = name_array[1].downcase
