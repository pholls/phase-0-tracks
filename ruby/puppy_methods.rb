class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

end

fido = Puppy.new

fido.fetch("ball")