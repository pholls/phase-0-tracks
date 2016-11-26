# BUSINESS LOGIC

# Require gems:
# Sqlite3
# Faker
require 'sqlite3'
require 'faker'

# Create database 

# Create (if not exist) tables:
# Doctors
# Patients

# Doctor's Database
# ID (primary key), name, specialization

# Patient Database
# Fields: ID (primary key), name, insurance (boolean), 
# next appointment (date), last appointment (date), doctor (foreign key)

# Program abilities:
# Add a new patient
# Delete a patient by name or by ID number
# View a patient's last appointment
# View a patient's upcoming appointment
# View patient's insurance status
# View patient's doctor's name
# Change a patient's upcoming appointment
# Update patient's insurance status
# Add/remove doctors
# Change specialization by doctor's name or id

# USER INTERFACE
# Loading statement before table creation
# Ready statement when ready
# Patient or doctor?
  # Add, Update, Remove, or View?
    # Add - go through each row and get data from user, input into table
    # Update - go through each row, get data, update into table
    # Remove - by name or id
      # confirm delete
      # delete row
    # View - display the relevant information in a pretty way

