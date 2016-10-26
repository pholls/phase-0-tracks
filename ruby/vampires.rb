puts "What is your name?"
employee_name = gets.chomp

puts "How old are you?"
age = gets.chomp

puts "What year were you born?"
birth_year = gets.chomp

if ((2016 - birth_year.to_i) == age.to_i) || ((2016 - birth_year.to_i) == (age.to_i + 1))
  valid_age = true
else
  valid_age = false
end

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
garlic_bread = gets.chomp

if garlic_bread.downcase == "yes" || garlic_bread.downcase == "y"
  garlic_bread = true
else
  garlic_bread = false
end

puts "Would you like to enroll in the company’s health insurance? (y/n)"
insurance = gets.chomp

if insurance.downcase == "yes" || insurance.downcase == "y"
  insurance = true
else
  insurance = false
end

result = "Results inconclusive."
if valid_age && (insurance || garlic_bread)
  result = "Probably not a vampire."
end

if valid_age == false && (!garlic_bread || !insurance)
  result = "Probably a vampire."
end

if valid_age == false && (!garlic_bread && !insurance)
  result = "Almost certainly a vampire."
end

if (employee_name.downcase == "drake cula") || (employee_name.downcase == "tu fang")
  result = "Definitely a vampire."
end
    
puts result