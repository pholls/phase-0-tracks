# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET that displays an address

get '/contact' do
  "1600 Pennsylvania Avenue NW<br>Washington, DC 20500, USA"
end

# write a GET that takes a person's name as a query parameter
# (not a route parameter) and says "Good job, [name]!"
# If query parameter is missing, route just says "Good job!"

get '/great_job/:name' do
  name = db.execute("SELECT name FROM students WHERE name=?", [params[:name]])[0]["name"]
  if name
    "Good job, #{name}!"
  else
    "Good job!"
  end
end

# A route that uses route parameters to add 
# two numbers and respond with the result

get '/:number1/plus/:number2' do
  result = params[:number1].to_i + params[:number2].to_i
  result.to_s
end

#BONUS: route that allows user to search the database somehow
# (you can simply modify the home page to take a query parameter
# and filter the students displayed if a query parameter is present)

get '/search/:letters' do
  search_string = '%' + params[:letters] + '%'
  returns = db.execute("SELECT name FROM students WHERE name LIKE ?", [search_string])
  search_results = ""
  returns.each do |result|
    search_results << "#{result["name"]}<br>"
  end
  search_results
end
