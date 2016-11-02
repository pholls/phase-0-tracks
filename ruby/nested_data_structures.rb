school = {
  basement: {
    boiler_room: ["Water Heater", "HVAC System"]
  },
  first_floor: {
    gymnasium: ["Basketball Hoop", "Basketball"],
    science_classroom: ["Beaker", "Bunsen Burner"],
    spanish_classroom: ["Libro", "Escritorio"]
  },
  second_floor: {
    math_classroom: ["Desk", "Textbook", "Calculator"],
    english_classroom: ["Poetry", "Novela", {
      robert_frost: "The Road Not Taken",
      edgar_allan_poe: "The Raven",
      wilfred_owen: "Dulce Et Decorum Est"
      } ]
  }
}

puts "Access school/first_floor/science_classroom"
p school[:first_floor][:science_classroom]

puts "Access school/second_floor/math_classroom at index 1"
p school[:second_floor][:math_classroom][1]

puts "Access school/basement/boiler_room at index 0"
p school[:basement][:boiler_room][0]

puts "Access school/second_floor/english_classroom at index 2"
p school[:second_floor][:english_classroom][2]

puts "Print by iterating over second level (rooms)"
school.each do |floor|
  floor.each do |room|
    p room
  end
end

# Expected the following code to print by iterating over third level (contents)
# Instead, received NoMethodError.
#
# school.each do |floor|
#   floor.each do |room|
#     room.each do |contents|
#       p contents
#     end
#   end
# end

p school[:second_floor][:english_classroom][2][:robert_frost]

# Call Array#reverse! on school[:basement][:boiler_room] to
# reverse the order of the elements within
school[:basement][:boiler_room].reverse!

# Print the new result to see how the data have changed
p school[:basement][:boiler_room][0]
