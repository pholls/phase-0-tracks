# BUSINESS LOGIC

# Require gems:
# Sqlite3
# Faker
require 'sqlite3'
require 'faker'

# Create database 
db = SQLite3::Database.new("doctors_office.db")
db.results_as_hash = true

# Create (if not exist) tables:
# Doctors
# ID (primary key), name, specialization
create_doctors_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS doctors(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  specialization VARCHAR(255)
  )
SQL
# Patients
# Fields: ID (primary key), name, insurance (boolean), 
# next appointment (date), last appointment (date), doctor (foreign key)
create_patients_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS patients(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  insurance BOOLEAN,
  next_appt DATE,
  last_appt DATE,
  doctor_id INT,
  FOREIGN KEY (doctor_id) REFERENCES doctors(id)
  )
SQL

db.execute(create_doctors_cmd)
db.execute(create_patients_cmd)

# Program abilities:
# Add a new patient
# Delete a patient by name or by ID number
# View a patient's last appointment
# View a patient's upcoming appointment
# View patient's insurance status
# View patient's doctor's name
# Assign a patient's doctor
# Change a patient's upcoming appointment
# Update patient's insurance status
# Add/remove doctors
def add_doctor(db, name, specialization)
  db.execute("INSERT INTO doctors (name, specialization) VALUES (?, ?)", [name, specialization])
end

def delete_doctor(db, name)
  db.execute("DELETE FROM doctors WHERE name = ?", [name])
end
# Change specialization by doctor's name or id

# USER INTERFACE
# Patient or doctor?
  # Add, Update, Remove, or View?
    # Add - go through each row and get data from user, input into table
    # Update - go through each row, get data, update into table
    # Remove - by name or id
      # confirm delete
      # delete row
    # View - display the relevant information in a pretty way

