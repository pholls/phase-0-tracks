puts "What is the hamster's name?"
hamster_name = gets.chomp

puts "How loud is the hamster? (1-10)"
volume_level = gets.chomp
volume_level.to_i

puts "What color is its fur?"
fur_color = gets.chomp

puts "Is it a good candidate for adoption? (y/n)"
good_candidate = gets.chomp

puts "What is its estimated age?"
estimated_age = gets.chomp

if estimated_age != ""
  estimated_age.to_i
else
  estimated_age = nil
end

puts ''
puts "Your hamster's name is " + hamster_name + "."
puts hamster_name + " is " + volume_level + " on the loudness scale."
puts hamster_name + " is " + fur_color + "."

if good_candidate == "y"
  puts hamster_name + " is a good candidate for adoption."
else
  puts hamster_name + " is not a good candidate for adoption."
end

if estimated_age != nil
  puts hamster_name + " is about " + estimated_age + " years old."
else
  print "We don't know how old your hamster is."
end
