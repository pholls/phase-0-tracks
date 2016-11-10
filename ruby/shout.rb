module Shout

  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words.upcase + "!!!" + " XD"
  end
end

p Shout.yell_angrily("EVERYTHING IS BROKEN")
p Shout.yell_happily("everything is going to be okay")