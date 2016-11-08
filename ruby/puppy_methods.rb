class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(integer)
    integer.times do |variable|
      puts "Woof!"
    end
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(integer)
    p integer * 7
  end

  def go_outside(string)
    if string == 'outside'
      puts "*runs to front door*"
    end
  end

  def initialize
    puts "Initializing new puppy instance..."
  end

end

fido = Puppy.new
fido.fetch("ball")
fido.speak(3)
fido.roll_over
fido.dog_years(10)
fido.go_outside('outside')

class Car
  
  def initialize
    puts "I'm a car! Beep beep!"
  end

  def red_light
    puts "Brakes on! Stopping!"
  end

  def destination(string)
    puts "Driving to #{string}!"
  end

end

car_array = []

50.times do
  car_array << Car.new
end

p car_array.length

car_array.each do |car|
  car.red_light
  car.destination("Hawaii")
end
