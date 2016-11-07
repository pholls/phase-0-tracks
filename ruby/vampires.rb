puts "How many employees will be processed?"
employee_number = gets.chomp

number = 0
until employee_number.to_i == number do
  
  puts "What is your name?"
  employee_name = gets.chomp
  
  puts "How old are you?"
  age = gets.chomp
  
  puts "What year were you born?"
  birth_year = gets.chomp
  
  if ((Time.now.year - birth_year.to_i) == age.to_i) || ((Time.now.year - birth_year.to_i) == (age.to_i + 1))
    valid_age = true
  else
    valid_age = false
  end
  
  puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"
  garlic_bread = gets.chomp
  
  garlic_bread = garlic_bread.downcase == "yes" || garlic_bread.downcase == "y"
  
  puts "Would you like to enroll in the company’s health insurance? (y/n)"
  insurance = gets.chomp
  
  insurance = insurance.downcase == "yes" || insurance.downcase == "y"

  allergy = ''
  until allergy.downcase == 'done'
    puts "Please list your allergies. Type \'done\' when finished."
    allergy = gets.chomp
    if allergy.downcase == "sunshine"
      break
    end
  end
  
  result = "Results inconclusive."
  if valid_age && (insurance || garlic_bread)
    result = "Probably not a vampire."
  end
  
  if (valid_age == false && (!garlic_bread || !insurance)) || allergy.downcase == "sunshine"
    result = "Probably a vampire."
  end
  
  if valid_age == false && (!garlic_bread && !insurance)
    result = "Almost certainly a vampire."
  end
  
  if (employee_name.downcase == "drake cula") || (employee_name.downcase == "tu fang")
    result = "Definitely a vampire."
  end
      
  puts "Results for " + employee_name + ": " + result
  puts ''

  number += 1;
end

puts "Actually, never mind! \nWhat do these questions have to do with anything? \nLet's all be friends."
