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

if insurance == "yes" || insurance == "y" || insurance == "Yes"
  insurance = true
elsif insurance == "no" || insurance == "n" || insurance == "No"
  insurance = false
end

if garlic_bread == "yes" || garlic_bread == "y" || garlic_bread == "Yes"
  garlic_bread = true
elsif garlic_bread == "no" || garlic_bread == "n" || garlic_bread == "No"
  garlic_bread = false
end

if ((2016 - birth_year.to_i) = age.to_i) && insurance
  result = "Probably not a vampire."
elsif (2016 - birth_year.to_i) = (age.to_i - 1)
  result = "Probably not a vampire."
else

    
