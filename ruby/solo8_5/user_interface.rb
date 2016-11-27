require 'sqlite3'
require 'faker'
require_relative 'project_file.rb'

# USER INTERFACE
# Patient or doctor?
puts "Welcome to the Doctor's Office Database."
puts "Enter 1 to enter Doctors Portal."
puts "Enter 2 for Patients Portal."
puts "Type 'done' to quit."

portal = gets.chomp

while portal != 'done'
  if portal == '1'
    puts "Doctors Portal"
    break
  elsif portal == '2'
    puts "Patients Portal"
    break
  else
    puts "Invalid input. Try again."
    portal = gets.chomp
  end
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

