require_relative 'project_file'

db = SQLite3::Database.new("doctors_office.db")
db.results_as_hash = true

# USER INTERFACE
# Patient or doctor?
while 1==1
  puts
  puts "***********************".center(75)
  puts "Doctors Office Database".center(75)
  puts "***********************".center(75)
  puts
  puts "Welcome to the Doctor's Office Database."
  puts "1. Enter Doctors Portal."
  puts "2. Enter Patients Portal."
  puts "Type 'done' to quit."
  
  portal = gets.chomp.downcase
  
  break if portal == 'done'

  while portal != 'done'
  
    if portal == '1'
  
      puts
      puts "**************".center(75)
      puts "Doctors Portal".center(75)
      puts "**************".center(75)
      puts
      puts "What would you like to do? Enter a command:"
      puts
      puts "Add   ".ljust(10) + "         (Add a new doctor)".rjust(20)
      puts "Update".ljust(10) + "  (Edit an existing doctor)".rjust(20)
      puts "Remove".ljust(10) + "(Remove an existing doctor)".rjust(20)
      puts "View  ".ljust(10) + "           (View doctor(s))".rjust(20)
      puts "Or type 'done' to exit."
      #type 'menu' at any time to discard and return to this menu
      input = gets.chomp.downcase
  
      case input
  
      when 'done'
        break
  
      when 'add'
        puts "What is the last name of the new doctor to add?"
        new_name = gets.chomp.capitalize
        break if new_name == 'Done'
        puts "What is Dr. #{new_name}'s specialty?"
        new_specialty = gets.chomp
        puts "Confirm the following data:"
        puts "-" * 30
        puts "New entry:"
        puts "Dr. #{new_name}, specialty: #{new_specialty}"
        puts "-" * 30
        puts "Is this correct? y/n"
        confirm = gets.chomp.downcase
  
        while 1 != 2
          case confirm
  
          when 'y'
            add_doctor(db, new_name, new_specialty)
            puts "SUCCESS"
            puts "Dr. #{new_name} has been added."
            break
  
          when 'n'
            puts "Dr. #{new_name} has NOT been added."
            break
  
          else
            puts "Invalid input, try again."
            confirm = gets.chomp.downcase
  
          end
        end
  
      when 'update'
        puts "What doctor are you updating? (Enter name or employee ID)"
  
      when 'delete'
        puts "What doctor shall be deleted? (Enter name or employee ID)"
  
      when 'view'
        puts "What doctor would you like to view? (Enter name or employee ID)"
        puts "Or type 'all' to see all doctors."
  
      end
  
    elsif portal == '2'
      puts "Patients Portal"
      puts
      break
  
    else
      puts "Invalid input. Try again."
      portal = gets.chomp
  
    end
  
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

