school = {
  basement: {
    boiler_room: ["Water Heater", "HVAC System"]
  },
  first_floor: {
    gymnasium: ["Basketball Hoop", "Basketball"],
    science_classroom: ["Beakers", "Bunsen Burners"],
    spanish_classroom: ["Libro", "Escritorio"]
  },
  second_floor: {
    math_classroom: ["Desk", "Textbook", "Calculator"],
    english_classroom: ["Poetry", "Novela"]
  }
}

# p school

p school[:first_floor][:science_classroom]

p school[:second_floor][:math_classroom][1]

p school[:basement][:boiler_room][0]

# Call Array#reverse! on school[:basement][:boiler_room]
school[:basement][:boiler_room].reverse!

# Print the new result to see how the data has changed
p school[:basement][:boiler_room][0]
