# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
"iNvEsTiGaTiOn".swapcase!
# => “InVeStIgAtIoN”
# .swapcase! returns the same result, but the bang means it modifies 
# the receiver in place: that is, it overwrites the input with the output.

"zom".gsub("o", "oo")
"zom".sub("o", "oo")
# => “zoom”

"enhance".center(15)
# => "    enhance    "

"Stop! You’re under arrest!".upcase
"Stop! You’re under arrest!".upcase!
# => "STOP! YOU’RE UNDER ARREST!"
# .upcase! returns the same result, but the bang means it modifies 
# the receiver in place: that is, it overwrites the input with the output.

"the usual".concat(" suspects")
"the usual" << " suspects"
#=> "the usual suspects"

" suspects".insert(0, "the usual")
" suspects".prepend("the usual")
# => "the usual suspects"

"The case of the disappearing last letter".chop
"The case of the disappearing last letter".chop!
"The case of the disappearing last letter".chomp("r")
# => "The case of the disappearing last lette"
# .chop! returns the same result, but the bang means it modifies 
# the receiver in place: that is, it overwrites the input with the output.

"The mystery of the missing first letter".slice(1..-1)
"The mystery of the missing first letter".gsub("T", "")
"The mystery of the missing first letter".sub("T", "")
"The mystery of the missing first letter".delete("T")
# => "he mystery of the missing first letter"

"Elementary,    my   dear        Watson!".squeeze
"Elementary,    my   dear        Watson!".squeeze!
# .squeeze! returns the same result, but the bang means it modifies 
# the receiver in place: that is, it overwrites the input with the output.
# => "Elementary, my dear Watson!"

"z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

"How many times does the letter 'a' appear in this string?".count("a")
# => 4
