# BUSINESS LOGIC

# define a method that takes one argument
  # a string
  # and it calls the below method with the string, the vowels, and the consonants
def switching(string)
  rec_switching(string, "aeiou", "bcdfghjklmnpqrstvwxyz")
end

# define a method that takes three arguments
  # a name, a string of vowels, and a string of consonants
  # compare each character to the vowels/consonants
    # if the character is a vowel, put the next vowel into alias_string
    # if the character is a consonant, put the next consonant into alias_string
# return alias_string
def rec_switching(name, vowels, consonants)
  new_name = ""
  name.each_char do |letter|
    #this is repetitive code: better way to do this? loops?
    if vowels.include?(letter)
      if vowels[vowels.index(letter) + 1] == nil
        new_name << vowels[0]
      else 
        new_name << vowels[vowels.index(letter) + 1]
      end
    elsif consonants.include?(letter)
      if consonants[consonants.index(letter) + 1] == nil
        new_name << consonants[0]
      else 
        new_name << consonants[consonants.index(letter) + 1]
      end
    end
  end
  new_name.capitalize
end

def build_hash(empty_hash = {}, fake_name, real_name)
  empty_hash[real_name] = fake_name.capitalize
end
# put the results into a new hash as the alias
# put the original input into the hash as the real name

p switching("steve")
p switching("pat")
p switching("zaub")

# define a method that breaks the user input into two separate strings
def user_input(alias_array = [], string)
  alias_array = string.downcase.split(' ').reverse
  user_alias = switching(alias_array[0]) + ' ' + switching(alias_array[1])
  p user_alias
end

user_input("Steve Rogers")
# reverse their position
# ignore case
# call switching() on the input

# USER INTERFACE
