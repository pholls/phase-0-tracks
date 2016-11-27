# BUSINESS LOGIC

# Require gems:
# Sqlite3
# Faker
require 'sqlite3'
require 'faker'
# require 'date'

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
  parse_date(date)
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
  parse_date(date)
end
# View patient's insurance status
def view_insurance(db, name_or_id)
  if name_or_id.to_i >= 1
    status = db.execute("SELECT insurance, name FROM patients WHERE id=?", [name_or_id])
  else
    status = db.execute("SELECT insurance, name FROM patients WHERE name=?", [name_or_id])
  end
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
# View all of a doctor's patients
def view_patient_list(db, doctor_name_or_id)
  if doctor_name_or_id.to_i >= 1
    patients = db.execute("SELECT patients.name FROM patients JOIN doctors ON patients.doctor_id=doctors.id WHERE doctors.id=?", [doctor_name_or_id])
  else
    patients = db.execute("SELECT patients.name FROM patients JOIN doctors ON patients.doctor_id=doctors.id WHERE doctors.name=?", [doctor_name_or_id])
  end
  patients.each do |hash|
    p hash['name']
  end
end
# View all of a doctor's upcoming appointments
def view_doctor_appointments(db, doctor_name_or_id)
  if doctor_name_or_id.to_i >= 1
    appointments = db.execute("SELECT patients.name, patients.next_appt FROM patients JOIN doctors ON patients.doctor_id=doctors.id WHERE doctors.id=?", [doctor_name_or_id])
  else
    appointments = db.execute("SELECT patients.name, patients.next_appt FROM patients JOIN doctors ON patients.doctor_id=doctors.id WHERE doctors.name=?", [doctor_name_or_id])
  end
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
  if patient_name_or_id.to_i >= 1
    patient_data = db.execute("SELECT patients.name, patients.id, doctors.name, patients.next_appt, patients.last_appt FROM doctors JOIN patients ON patients.doctor_id=doctors.id WHERE patients.id=?", [patient_name_or_id])
  else
    patient_data = db.execute("SELECT patients.name, patients.id, doctors.name, patients.next_appt, patients.last_appt FROM doctors JOIN patients ON patients.doctor_id=doctors.id WHERE patients.name=?", [patient_name_or_id])
  end
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
  if doctor_name_or_id.to_i >= 1
    doctor_info = db.execute("SELECT id, name, specialty FROM doctors WHERE id=?", [doctor_name_or_id])
  else
    doctor_info = db.execute("SELECT id, name, specialty FROM doctors WHERE name=?", [doctor_name_or_id])
  end
  puts "-------------------------------------"
  puts "Employee Summary for Dr. " + doctor_info[0]['name'] + ":"
  puts "Employee ID#: " + doctor_info[0]['id'].to_s
  puts "Specialty: " + doctor_info[0]['specialty']
  puts "-------------------------------------"
end

#add a method to verify the data (ID or name exists)
def verify_data(db, name_or_id)
  # if name_or_id.to_i >= 1
  #   if db.execute("SELECT DISTINCT name FROM patients WHERE patients.id=?", [name_or_id]) == {}
  #     false
  #   else
  #     true
  #   end
  # else
  #   if db.execute("SELECT DISTINCT name FROM patients WHERE patients.name=?", [name_or_id]) == {}
  #     false
  #   else
  #     true
  #   end
  # end
end

# p verify_data(db, 1000)
# p verify_data(db, 100)

# view_one_doctor(db, "Murphy")
# Driver Code
# def fake_last_date
#   year = Faker::Number.between(2010, 2016).to_s
#   month = Faker::Number.between(10, 12).to_s
#   day = Faker::Number.between(10,28).to_s
#   date = year << month << day
#   date.to_i
# end

# def fake_next_date
#   year = Faker::Number.between(2017, 2020).to_s
#   month = Faker::Number.between(10, 12).to_s
#   day = Faker::Number.between(10,28).to_s
#   date = year << month << day
#   date.to_i
# end

# 100.times do
#   add_doctor(db, Faker::Name.last_name, Faker::Company.buzzword)
#   add_patient(db, Faker::Name.name, Faker::Boolean.boolean.to_s, fake_next_date, fake_last_date, Faker::Number.between(1, 100))
# end

# view_doctor_appointments(db, 1)
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
# p view_insurance(db, 3)
# p view_patient_doctor(db, "Korbin Conroy")
# update_doctor(db, "Korbin Conroy", 3)
# p view_patient_doctor(db, "Korbin Conroy")
# update_appointment(db, "Korbin Conroy", 20170312)
# p next_appointment(db, "Korbin Conroy")
# update_insurance(db, "Korbin Conroy", "false")
# p view_insurance(db, "Korbin Conroy")
# p last_appointment(db, 5)
# view_all_doctors(db)
# view_one_patient(db, 1)
