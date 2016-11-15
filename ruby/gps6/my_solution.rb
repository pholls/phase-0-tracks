# Virus Predictor

# I worked on this challenge [with: Vilde Vevatne].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# This statement lets the my_solution.rb code know that it needs to use the 
# code from state_data.rb. It's equivalent to putting that code at the top of this file.
# It is different from require because it uses relative file path of the indicated file
# require_relative is a simpler way of requiring a file.
require_relative 'state_data'

class VirusPredictor
  
  # starts the class and sets the default values with user input
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # calls the predicted_deaths and speed_of_spread methods on the inputted variables
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # calculates the total number of deaths expected based on the population 
  # density of the state, and prints the output
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
  
  # determines how fast the virus will spread based on the population density
  # of the state and prints it at the bottom
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each_key do |state|
  VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population]).virus_effects
end

#=======================================================================
# Reflection Section

# Hash keys are declared using a string and a hash rocket or with symbols.
# The String is used because it's user-friendly, and it will print to the console when the program runs.
# It is easier for a user to use and understand.
# The symbols are for internal use, for the programmer, and as such don't need to be Strings.

# require_relative allows you to easily load a file that is relative to the 
# file containing the statement. It's an easy way to declare a file using its relative path.
# The "relative" means it is relative to the directory of the file in which it is declared. 

# You can iterate through a hash with .each_key, which iterates over the hash
# and calls the block once for each key, passing the key as the parameter.
# Also valid are:
# .each {|key, value| block}
# .each_pair {|key, value| block}
# .each_value {|key, value| block}

# The variables seemed repetitive, and unnecessary, because they are 
# instance variables that every method inside the Class has access to,
# so they didn't need to be passed into the method calls.

# This challenge gave me a better understanding of classes, instance variables, 
# and instance methods.
# It introduced me to private methods and constants.
