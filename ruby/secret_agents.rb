# Encrypt (take a string as an argument):
# Break the string into individual letters
# Advance each letter one letter forward
# Loop until the whole string has been advanced one letter forward
# end

def encrypt(password)
  number = 0
  encrypted_password = ""
  until number == password.length
    if password[number] == " "
      encrypted_password += " "
      number += 1
    end
    encrypted_password += password[number].next
    number += 1
  end
  puts encrypted_password
end

encrypt("pass word")

# Decrypt (takes encrypted string as an argument):
# Break the string into individual letters
# Reverse each letter one letter backward
# Loop until the whole string has been reversed one letter back
# end

