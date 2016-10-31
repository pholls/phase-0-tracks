# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”
# .swapcase! returns the same result, but the bang means it modifies 
# the receiver in place: that is, it overwrites the input with the output.

# "zom".<???>
# => “zoom”

# "enhance".<???>
# => "    enhance    "

"Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"
# .upcase! returns the same result, but the bang means it modifies 
# the receiver in place: that is, it overwrites the input with the output.

# "the usual".<???>
#=> "the usual suspects"

# " suspects".<???>
# => "the usual suspects"

"The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"
# .chop! returns the same result, but the bang means it modifies 
# the receiver in place: that is, it overwrites the input with the output.

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

# "z".<???>
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

# "How many times does the letter 'a' appear in this string?".<???>
# => 4