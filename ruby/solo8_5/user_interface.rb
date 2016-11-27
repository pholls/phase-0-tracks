require_relative 'project_file.rb'

# USER INTERFACE
# Patient or doctor?
puts "Welcome to the Doctor's Office Database."
puts "Enter 1 to enter Doctors Portal."
puts "Enter 2 for Patients Portal."
puts "Type 'done' to quit."

portal = gets.chomp.downcase

while portal != 'done'
  if portal == '1'
    puts "**************".center(75)
    puts "Doctors Portal".center(75)
    puts "**************".center(75)
    puts
    puts "What would you like to do?\nAdd, Update, Remove, or View a Doctor?"
    puts "Or type 'done' to exit."
    break
  elsif portal == '2'
    puts "Patients Portal"
    puts
    break
  else
    puts "Invalid input. Try again."
    portal = gets.chomp
  end
  break if portal == 'quit'
  break if portal == 'exit'
end

  # Add, Update, Remove, or View?
    # Add - go through each row and get data from user, input into table
    # Update - go through each row, get data, update into table
    # Remove - by name or id
      # confirm delete
      # delete row
    # View - display the relevant information in a pretty way
      # View what? 
        # Next appt, last appt, Doctor, insurance status

