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

end

fido = Puppy.new

fido.fetch("ball")

fido.speak(3)

fido.roll_over

fido.dog_years(10)

fido.go_outside('outside')
