# BUSINESS LOGIC

# Require gems:
# Sqlite3
# Faker
require 'sqlite3'
require 'faker'
require 'date'

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
  if name_or_id.to_i >= 1
    db.execute("DELETE FROM patients WHERE id=?", [name_or_id])
  else
    db.execute("DELETE FROM patients WHERE name=?", [name_or_id])
  end
end
# View a patient's last appointment
def last_appointment(db, name_or_id)
  if name_or_id.to_i >= 1
    full_date = db.execute("SELECT last_appt FROM patients WHERE id=?", [name_or_id])
  else
    full_date = db.execute("SELECT last_appt FROM patients WHERE name=?", [name_or_id])
  end
  date = full_date[0]["last_appt"]
end

def parse_date(numbers)
  string = numbers.to_s
  year = string.slice!(0...4).to_i
  month = string.slice!(0..1).to_i
  day = string.to_i
  parsed_date = Date.new(year,month,day)
  Date::DAYNAMES[parsed_date.wday] + ", " + Date::MONTHNAMES[month] + " " + day.to_s + ", " + year.to_s
end
# View a patient's upcoming appointment
def next_appointment(db, name_or_id)
  if name_or_id.to_i >= 1
    full_date = db.execute("SELECT next_appt FROM patients WHERE id=?", [name_or_id])
  else
    full_date = db.execute("SELECT next_appt FROM patients WHERE name=?", [name_or_id])
  end
  date = full_date[0]["next_appt"]
end
# View patient's insurance status
def view_insurance(db, name_or_id)
  if name_or_id.to_i >= 1
    status = db.execute("SELECT insurance FROM patients WHERE id=?", [name_or_id])
  else
    status = db.execute("SELECT insurance FROM patients WHERE name=?", [name_or_id])
  end
  status = status[0]["insurance"]
end
# View patient's doctor's name
def view_patient_doctor(db, name_or_id)
  if name_or_id.to_i >= 1
    doctor_name = db.execute("SELECT patients.name, doctors.name FROM patients JOIN doctors ON patients.doctor_id=doctors.id WHERE patients.id=?", [name_or_id])
  else
    doctor_name = db.execute("SELECT patients.name, doctors.name FROM patients JOIN doctors ON patients.doctor_id=doctors.id WHERE patients.name=?", [name_or_id])
  end
  doctor_name = doctor_name[0]["name"]
end
# Assign a patient's doctor
def update_doctor(db, patient_name_or_id, doctor_id)
  if patient_name_or_id.to_i >= 1
    db.execute("UPDATE patients SET doctor_id=? WHERE id=?", [doctor_id, patient_name_or_id])
  else
    db.execute("UPDATE patients SET doctor_id=? where name=?",[doctor_id, patient_name_or_id])
  end
end
# Change a patient's upcoming appointment
def update_appointment(db, patient_name_or_id, date)
  if patient_name_or_id.to_i >= 1
    db.execute("UPDATE patients SET next_appt=? WHERE id=?", [date, patient_name_or_id])
  else
    db.execute("UPDATE patients SET next_appt=? WHERE name=?", [date, patient_name_or_id])
  end
end
# Update patient's insurance status
def update_insurance(db, patient_name_or_id, insurance)
  if patient_name_or_id.to_i >= 1
    db.execute("UPDATE patients SET insurance=? WHERE id=?", [insurance, patient_name_or_id])
  else
    db.execute("UPDATE patients SET insurance=? WHERE name=?", [insurance, patient_name_or_id])
  end
end
# Add/remove doctors
def add_doctor(db, name, specialty)
  db.execute("INSERT INTO doctors (name, specialty) VALUES (?, ?)", [name, specialty])
end

def delete_doctor(db, name_or_id)
  if name_or_id.to_i >= 1
    db.execute("DELETE FROM doctors WHERE id = ?", [name_or_id])
  else
    db.execute("DELETE FROM doctors WHERE name = ?", [name_or_id])
  end
end
# Change specialty by doctor's name or id
def change_spec(db, name_or_id, new_spec)
  if name_or_id.to_i >= 1
    db.execute("UPDATE doctors SET specialty = ? WHERE id = ?", [new_spec, name_or_id])
  else
    db.execute("UPDATE doctors SET specialty = ? WHERE name = ?", [new_spec, name_or_id])
  end
end

# Driver Code
# add_doctor(db, Faker::Name.name, "Toxicology")
# docs = db.execute("SELECT * FROM doctors")
# change_spec(db, 1, "Phrenology")
# docs.each do |doctor|
#   puts "Dr. #{doctor['name']}'s specialty is #{doctor['specialty']}"
# end
# delete_doctor(db, 1)
# docs.each do |doctor|
#   puts "Dr. #{doctor['name']}'s specialty is #{doctor['specialty']}"
# end
# add_patient(db, Faker::Name.name, "true", 20170502, 20161105, 1)
# all_patients = db.execute("SELECT * FROM patients")
# all_patients.each do |patient|
#   puts "#{patient['name']} has an appointment on #{patient['next_appt']}"
# end
# delete_patient(db, 2)
# all_patients.each do |patient|
#   puts "#{patient['name']} has an appointment on #{patient['next_appt']}"
# end
# p last_appointment(db, "Korbin Conroy")
# p next_appointment(db, "Korbin Conroy")
# p view_insurance("Korbin Conroy")
# p view_patient_doctor(db, "Korbin Conroy")
# update_doctor(db, "Korbin Conroy", 3)
# p view_patient_doctor(db, "Korbin Conroy")
# update_appointment(db, "Korbin Conroy", 20170312)
# p next_appointment(db, "Korbin Conroy")
# update_insurance(db, "Korbin Conroy", "false")
# p view_insurance(db, "Korbin Conroy")
p parse_date(last_appointment(db, "Korbin Conroy"))

# USER INTERFACE
# Patient or doctor?
  # Add, Update, Remove, or View?
    # Add - go through each row and get data from user, input into table
    # Update - go through each row, get data, update into table
    # Remove - by name or id
      # confirm delete
      # delete row
    # View - display the relevant information in a pretty way
      # View what? 
        # Next appt, last appt, Doctor, insurance status

