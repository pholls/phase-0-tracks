class Santa

  attr_reader :age, :ethnicity

  attr_accessor :gender

  def initialize(gender, ethnicity, age)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = age
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking.delete(reindeer_name)
    @reindeer_ranking << reindeer_name
  end

end

santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# example_genders.length.times do |i|
#   santas << Santa.new(example_genders[i], example_ethnicities[i])
# end

# kris_kringle = Santa.new("gender nonbinary", "hyphenated-American")
# kris_kringle.speak
# kris_kringle.eat_milk_and_cookies("milano")
# kris_kringle

# saint_nick = Santa.new("gender fluid", "biracial")
# p saint_nick.get_mad_at("Rudolph")
# p saint_nick.age
# p saint_nick.ethnicity
# p saint_nick.celebrate_birthday
# p saint_nick.age
# p saint_nick.gender = "binary"
# puts "Saint Nick is #{saint_nick.ethnicity} and #{saint_nick.age} years old and gender is #{saint_nick.gender}."

1000.times do
  santa = Santa.new(example_genders[rand(0..7)], example_ethnicities[rand(0..7)], rand(0..140))
  p "This Santa is a #{santa.age}-year-old #{santa.ethnicity} #{santa.gender}."
end
