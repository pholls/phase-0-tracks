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
  puts "MAIN MENU".center(75)
  puts "1. Enter Doctors Portal."
  puts "2. Enter Patients Portal."
  puts
  puts "Type 'done' to quit."
  
  portal = gets.chomp.downcase
  
  break if portal == 'done'

  while portal != 'done'
  
    if portal == '1'
  
      puts
      puts "--------------".center(75)
      puts "Doctors Portal".center(75)
      puts "--------------".center(75)
      puts
      puts "What would you like to do? Enter a command:"
      puts
      puts "Add   ".ljust(10) + "                   (Add a new doctor)".rjust(20)
      puts "Update".ljust(10) + "(Edit an existing doctor's specialty)".rjust(20)
      puts "Remove".ljust(10) + "          (Remove an existing doctor)".rjust(20)
      puts "View  ".ljust(10) + "   (View a doctors' info or patients)".rjust(20)
      puts
      puts "Or type 'back' to return to main menu."
      #type 'menu' at any time to discard and return to this menu
      input = gets.chomp.downcase
  
      case input
  
      when 'back'
        break
  
      when 'add'
        puts
        puts "What is the last name of the new doctor to add?"
        new_name = gets.chomp.capitalize
        break if new_name == 'Done'
        puts
        puts "What is Dr. #{new_name}'s specialty?"

        new_specialty = gets.chomp

        puts
        puts "Confirm the following data:"
        puts
        puts "-" * 30
        puts "New entry:"
        puts "Dr. #{new_name}, specialty: #{new_specialty}"
        puts "-" * 30
        puts
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
            puts
            puts "Dr. #{new_name} has NOT been added."
            puts "Press enter to continue."
            gets
            break
  
          else
            puts "Invalid input, try again."
            confirm = gets.chomp.downcase
  
          end

        end
  
      when 'update'
        puts
        puts "What doctor are you updating? (Enter name or employee ID)"
        doctor_to_edit = gets.chomp
        puts

        view_one_doctor(db, doctor_to_edit)
        puts
        puts "Enter new specialty:"
        change = gets.chomp
        change_spec(db, doctor_to_edit, change)
        puts 
        puts "Updated information:"
        view_one_doctor(db, doctor_to_edit)
        puts
        puts "Hit enter to continue"
        gets.chomp
  
      when 'remove'
        puts
        puts "What doctor shall be deleted? (Enter name or employee ID)"
        doctor_to_delete = gets.chomp
        puts

        puts "Doctor to delete:"
        view_one_doctor(db, doctor_to_delete)
        puts
        puts "Delete this doctor? y/n"
        confirm = gets.chomp.downcase
  
        while 1 != 2
          case confirm
  
          when 'y'
            delete_doctor(db, doctor_to_delete)
            puts
            puts "Doctor successfully deleted."
            puts
            sleep 1
            break
  
          when 'n'
            puts
            puts "Doctor has NOT been deleted."
            puts "Press enter to continue."
            gets
            break
  
          else
            puts "Invalid input, try again."
            confirm = gets.chomp.downcase
  
          end
        end
  
      when 'view'
        puts
        puts "Which doctor would you like to view? (Enter name or employee ID)"
        puts "Or type 'all' to see all doctors."
        doctor_to_view = gets.chomp
        puts

        if doctor_to_view == 'all'
          view_all_doctors(db)
          puts "Hit enter to continue."
          gets
        else
          view_one_doctor(db, doctor_to_view)
          puts "Hit enter to continue."
          gets
        end

      else
        puts
        puts "Invalid input. Try again."
        sleep 1
  
      end
  
    elsif portal == '2'
      puts
      puts "--------------".center(75)
      puts "Patients Portal".center(75)
      puts "--------------".center(75)
      puts
      puts "What would you like to do? Enter a command:"
      puts
      puts "Add    ".ljust(10) + "              (Add a new patient)".rjust(20)
      puts "Update ".ljust(10) + "       (Edit an existing patient)".rjust(20)
      puts "Remove ".ljust(10) + "     (Remove an existing patient)".rjust(20)
      puts "View   ".ljust(10) + "(See information about a patient".rjust(20)
      puts "List   ".ljust(10) + "              (List all patients)".rjust(20)
      puts
      puts "Or type 'back' to return to main menu."
      input = gets.chomp.downcase
      
      case input

      when 'back'
        break

      when 'add'
        puts
        puts "What is the full name of the patient to add?"
        patient_to_add = gets.chomp
        puts
        puts "Who is #{patient_to_add}'s preferred doctor?"
        puts "Enter name or employee ID."
        puts "(If none, just hit enter)"
        preferred_doctor = gets.chomp
        if preferred_doctor == ''
          preferred_doctor = rand(0..101)
        end
        puts
        puts "When was #{patient_to_add}'s last appointment?"
        puts "Format: YYYYMMDD"
        new_patient_last_appt = gets.chomp
        puts
        puts "When will #{patient_to_add}'s next appointment be?"
        puts "Format: YYYYMMDD"
        new_patient_next_appt = gets.chomp
        puts
        puts "Does #{patient_to_add} have insurance? y/n"

        while 1 != 2
          new_patient_insurance = gets.chomp
          if new_patient_insurance == 'y'
            new_patient_insurance = 'true'
            break
          elsif new_patient_insurance == 'n'
            new_patient_insurance = 'false'
            break
          else
            puts "Invalid input. Try again."
          end
        end

        add_patient(db, patient_to_add, new_patient_insurance, new_patient_next_appt, new_patient_last_appt, preferred_doctor)
        puts "Confirm new patient data:"
        view_one_patient(db, patient_to_add)
        puts
        puts "Is this correct? y/n"
        verify = gets.chomp.downcase

        while 1 != 2

          case verify

          when 'y'
            puts "#{patient_to_add} added."
            break

          when 'n'
            puts "#{patient_to_add} NOT added."
            delete_patient(db, patient_to_add)
            break

          else
            puts "Invalid input. Try again."
            verify = gets.chomp.downcase
            
          end

        end

      when 'update'
        break

      when 'remove'
        puts
        puts "What patient shall be deleted? (Enter name or patient ID)"
        patient_to_delete = gets.chomp
        puts

        puts "Patient to delete:"
        view_one_patient(db, patient_to_delete)
        puts
        puts "Delete this patient? y/n"
        confirm = gets.chomp.downcase
  
        while 1 != 2
          case confirm
  
          when 'y'
            delete_patient(db, patient_to_delete)
            puts
            puts "Patient successfully deleted."
            puts
            sleep 1
            break
  
          when 'n'
            puts
            puts "Patient has NOT been deleted."
            puts "Press enter to continue."
            gets
            break
  
          else
            puts "Invalid input, try again."
            confirm = gets.chomp.downcase
  
          end
        end

      when 'view'
        puts
        puts "Which patient would you like to view? (Enter name or patient ID)"
        patient_to_view = gets.chomp
        puts
        view_one_patient(db, patient_to_view)
        puts
        puts "Hit enter to continue."
        gets

      when 'list'
        view_all_patients(db)
        puts
        puts "Press enter to continue"
        gets

      else
        puts
        puts "Invalid input. Try again."
        sleep 1

      end
  
    else
      puts
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

