# Encrypt (take a string as an argument):
# Break the string into individual letters
# Advance each letter one letter forward
# Loop until the whole string has been advanced one letter forward
# end

def encrypt(string1)
  number = 0
  encrypted_password = ""
  until number == string1.length
    if string1[number] == " "
      encrypted_password += " "
      number += 1
    elsif string1[number] == "z"
      encrypted_password += "a"
      number += 1
    end
    encrypted_password += string1[number].next
    number += 1
  end
  puts encrypted_password
  encrypted_password
end

# test code:
# encrypt("pass word")

# Decrypt (takes encrypted string as an argument):
# Break the string into individual letters
# Reverse each letter one letter backward
# Loop until the whole string has been reversed one letter back
# end

def decrypt(string2)
  number = 0
  decrypted_password = ""
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  until number == string2.length
    if string2[number] == " "
      decrypted_password += " "
      number += 1
    else
    decrypted_password += alphabet[(alphabet.index(string2[number]) - 1)]
    number += 1
    end
  end
  puts decrypted_password
  decrypted_password
end

# test code:
# decrypt("qbtt xpse")

# Release 3 Driver Code:
# encrypt("abc")
# encrypt("zed")
# decrypt("bcd")
# decrypt("afe")

# Release 4 Driver Code:
# decrypt(encrypt("swordfish"))
# This works because we added a line at the end of the method to return the variable.
# Without this line, it returned `nil` and the method did not work in a nested call.
# We received a NoMethodError. Now it works.

# Release 5 Pseudocode:
# puts "encrypt or decrypt"
  #input = gets.chomp
# if/else statement for encrypt or decrypt
# ask for the password to encrypt or decrypt
  # call proper method based on input
  # print result
# exit

puts "Greetings, Secret Agent.\nEncrypt or decrypt a password?"
encryption = gets.chomp

until encryption.downcase == "encrypt" || encryption.downcase == "decrypt"
  puts "Invalid input."
  puts "Encrypt or decrypt?"
  encryption = gets.chomp
end

puts "What is the password?"
password = gets.chomp
if encryption.downcase == "encrypt"
  encrypt(password)
elsif encryption.downcase == "decrypt"
  decrypt(password)
end

