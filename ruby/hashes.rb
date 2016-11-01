# CLIENT INFO PROGRAM 
# ask for client's name
# save input in hash
# ask for client's age
# save input in hash
  # convert to integer
# ask for client's number of children
  # convert input to integer
  # save in hash
# ask for client's retro preference
  # convert to boolean
  # save in hash
# ask for client's decor theme
  # save input in hash
#print the hash to the screen
# ask if user would like to make any updates
  # convert input to symbol
  # update value for corresponding key
  # skip if input is 'none'
# print hash to the screen

client_info = {}
puts "What is the client's name?"
client_info[:name] = gets.chomp

puts "What is the client's age?"
client_info[:age] = gets.chomp.to_i

puts "How many children are in the client's household?"
client_info[:children] = gets.chomp.to_i

puts "Does the client prefer a \'retro\' aesthetic? (y/n)"
input = gets.chomp
if input == "y"
  client_info[:retro] = true
else
  client_info[:retro] = false
end

puts "What is the client's general decor theme?"
client_info[:decor] = gets.chomp

p client_info 