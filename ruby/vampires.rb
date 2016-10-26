puts "What is your name?"
employee_name = gets.chomp

puts "How old are you?"
age = gets.chomp

puts "What year were you born?"
birth_year = gets.chomp

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
garlic_bread = gets.chomp

puts "Would you like to enroll in the company’s health insurance? (y/n)"
insurance = gets.chomp

if insurance == "yes"
  insurance = "y"
elsif insurance == "no"
  insurance = "n"
elsif insurance == "Yes"
  insurance = "y"
elsif insurance == "No"
  insurance = "n"
end

if garlic_bread == "yes"
  garlic_bread = "y"
elsif garlic_bread == "no"
  garlic_bread = "n"
elsif garlic_bread == "Yes"
  garlic_bread = "y"
elsif garlic_bread == "No"
  garlic_bread = "n"
end

if (2016 - birth_year.to_i) = age.to_i
  result = "Probably not a vampire."
elsif (2016 - birth_year.to_i) = (age.to_i - 1)
  result = "Probably not a vampire."
