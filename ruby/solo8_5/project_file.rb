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
# ID (primary key), name, specialty
create_doctors_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS doctors(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  specialty VARCHAR(255)
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

# Program capabilities:
# Add a new patient
def add_patient(db, name, insurance, next_appt, last_appt, doctor_id)
  db.execute("INSERT INTO patients (name, insurance, next_appt, last_appt, doctor_id) VALUES (?, ?, ?, ?, ?)", [name, insurance, next_appt, last_appt, doctor_id])
end
# Delete a patient by name or by ID number
def delete_patient(db, name_or_id)
  db.execute("DELETE FROM patients WHERE id=? OR name=?", [name_or_id, name_or_id])
end
# method to change patient name
def change_patient_name(db, patient_name_or_id, new_name)
  db.execute("UPDATE patients SET name=? WHERE name=? OR id=?", [new_name, patient_name_or_id, patient_name_or_id])
end

def parse_date(numbers)
  string = numbers.to_s
  year = string.slice!(0...4).to_i
  month = string.slice!(0..1).to_i
  day = string.to_i
  parsed_date = Date.new(year,month,day)
  Date::DAYNAMES[parsed_date.wday] + ", " + Date::MONTHNAMES[month] + " " + day.to_s + ", " + year.to_s
end

# View patient's insurance status
def view_insurance(db, name_or_id)
  status = db.execute("SELECT insurance, name FROM patients WHERE id=? OR name=?", [name_or_id, name_or_id])
  name = status[0]["name"]
  status = status[0]["insurance"]
  case status
  when 'false'
    puts "#{name} is uninsured."
    status = false
  when 'true'
    puts "#{name} has insurance and is within their network."
    status = true
  end
end

# Assign a patient's doctor
def update_doctor(db, patient_name_or_id, doctor_id)
  db.execute("UPDATE patients SET doctor_id=? WHERE patients.id=? OR patients.name=?", [doctor_id, patient_name_or_id, patient_name_or_id])
end
# Change a patient's upcoming appointment
def update_appointment(db, patient_name_or_id, date)
  db.execute("UPDATE patients SET next_appt=? WHERE id=? OR name=?", [date, patient_name_or_id, patient_name_or_id])
end
# Update patient's insurance status
def update_insurance(db, patient_name_or_id, insurance)
  db.execute("UPDATE patients SET insurance=? WHERE id=? OR name=?", [insurance, patient_name_or_id, patient_name_or_id])
end
# Add doctors
def add_doctor(db, name, specialty)
  db.execute("INSERT INTO doctors (name, specialty) VALUES (?, ?)", [name, specialty])
end
# Delete doctor by name or id
def delete_doctor(db, name_or_id)
  db.execute("DELETE FROM doctors WHERE id=? OR name=?", [name_or_id, name_or_id])
end
# Change specialty by doctor's name or id
def change_spec(db, name_or_id, new_spec)
  db.execute("UPDATE doctors SET specialty=? WHERE id=? OR name=?", [new_spec, name_or_id, name_or_id])
end
# View all of a doctor's patients
def view_patient_list(db, doctor_name_or_id)
  patients = db.execute("SELECT patients.name FROM patients JOIN doctors ON patients.doctor_id=doctors.id WHERE doctors.id=? OR doctors.name=?", [doctor_name_or_id, doctor_name_or_id])
  patients.each do |hash|
    p hash['name']
  end
end
# View all of a doctor's upcoming appointments
def view_doctor_appointments(db, doctor_name_or_id)
  appointments = db.execute("SELECT patients.name, patients.next_appt FROM patients JOIN doctors ON patients.doctor_id=doctors.id WHERE doctors.id=? OR doctors.name=?", [doctor_name_or_id, doctor_name_or_id])
  appointments.each do |hash|
    p parse_date(hash['next_appt']) + " - " + hash['name'] 
  end
end

# view all doctors
def view_all_doctors(db)
  doctor_list = db.execute("SELECT id, name, specialty FROM doctors")
  doctor_list.each do |hash|
    puts "-------------------------------------"
    puts hash['id'].to_s + ": Dr. " + hash['name']
    puts "Specialty: " + hash['specialty']
  end
end

# view all patients
def view_all_patients(db)
  patient_list = db.execute("SELECT patients.name, patients.id, doctors.name, patients.next_appt, patients.last_appt FROM doctors JOIN patients ON patients.doctor_id=doctors.id")
  patient_list.each do |hash|
    puts "-------------------------------------"
    puts "Patient summary for: " + hash[0]
    puts "Patient ID: " + hash['id'].to_s
    puts "Primary Physician: Dr. " + hash['name']
    puts "Last appointment: " + parse_date(hash['last_appt'])
    puts "Next appointment: " + parse_date(hash['next_appt'])
  end
end

# view one patient's info
# ID, name, insurance, appointments, and doctor
def view_one_patient(db, patient_name_or_id)
  patient_data = db.execute("SELECT patients.name, patients.id, doctors.name, patients.next_appt, patients.last_appt FROM doctors JOIN patients ON patients.doctor_id=doctors.id WHERE patients.id=? OR patients.name=?", [patient_name_or_id, patient_name_or_id])
  puts "-------------------------------------"
  puts "Patient summary for: " + patient_data[0][0]
  puts "Patient ID#: " + patient_data[0]['id'].to_s
  puts "Primary Physician: Dr. " + patient_data[0]['name']
  puts "Last appointment: " + parse_date(patient_data[0]['last_appt'])
  puts "Next appointment: " + parse_date(patient_data[0]['next_appt'])
  view_insurance(db, patient_name_or_id)
  puts "-------------------------------------"
end

# view one doctor's info
# ID, name, specialty
def view_one_doctor(db, doctor_name_or_id)
  doctor_info = db.execute("SELECT id, name, specialty FROM doctors WHERE id=? OR name=?", [doctor_name_or_id, doctor_name_or_id])
  puts "-------------------------------------"
  puts "Employee Summary for Dr. " + doctor_info[0]['name'] + ":"
  puts "Employee ID#: " + doctor_info[0]['id'].to_s
  puts "Specialty: " + doctor_info[0]['specialty']
  puts "-------------------------------------"
end

# add a method to verify the data (ID or name exists)
def verify_data(db, name_or_id, pat_or_doc)
  # I think this is still vulnerable to SQL injection, but when I replace
  # #{pat_or_doc} or #{variable} with ? I get an error:
  # `initialize': near "?": syntax error (SQLite3::SQLException)
  variable = pat_or_doc
  if db.execute("SELECT name FROM #{variable} WHERE id=? OR name=?", [name_or_id, name_or_id]) == []
    false
  else
    true
  end
end

# Method that counts number of doctors in table
# Return the number
def count_doctors(db)
  doctor_list = db.execute("SELECT id, name, specialty FROM doctors")
  i = 0
  doctor_list.each do |hash|
    i = hash['id']
  end
  i
end

# search method
  # add to doctor and patient portals
  # enter a name
    # run verify_data on it
      # return the data if it's there
    # otherwise, say "not found" 
      # loop chopping off last character and searching remaining string until something is returned
        # display result to the user "did you mean [this]?"

