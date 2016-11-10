# module Shout

#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yell_happily(words)
#     words.upcase + "!!!" + " XD"
#   end
# end

# p Shout.yell_angrily("EVERYTHING IS BROKEN")
# p Shout.yell_happily("everything is going to be okay")

module Shout
  def yell_angrily(words)
    puts words.upcase + "!!! >:("
  end
  def yell_happily(words)
    puts words.upcase + "! XD XD XD"
  end
end

class Child
  include Shout
end

class Angry_Old_Man
  include Shout
end

toddler = Child.new
toddler.yell_happily("I love ice cream!")
toddler.yell_angrily("I hate raisins!")

old_guy = Angry_Old_Man.new
old_guy.yell_angrily("The rent is 2 damn high!")
old_guy.yell_happily("Ya gotta believe")
