def my_method
  variable = "\"Hello, World\""
  puts "The block has not run yet."
  yield(variable)
  puts "The block has run."
end

my_method { |variable| puts "When a computer wakes up, it says #{variable}" }

oscar_categories = ["Best Picture", "Best Editing", "Best Director"]

famous_roles = {
  George_Clooney: "Danny Ocean",
  Keanu_Reeves: "Neo"
}

oscar_categories.each do |category|
  puts category
end

famous_roles.each do |actor, role|
  puts "#{actor} played #{role}"
end

puts "Pre-map data structures:"
p oscar_categories
p famous_roles

oscar_categories.map! do |category|
  category.upcase
end

puts "Post-map data structures:"
p oscar_categories
p famous_roles

#########################

# Declare sample array and hash
sample_ary = ["a", "b", "c", "d", "e"]
sample_hash = {
  sky: "blue",
  sea: "green",
  trees: "tall",
  dirt: "dirty"
}

# Print the data before they are modified to verify
puts "Pre-modified data:"
p sample_ary
p sample_hash

# Print the modified data to see how it changes the array and hash.
puts "Modified data: #delete_if"
p sample_ary.delete_if { |letter| letter > "d" }
p sample_hash.delete_if { |key, value| value == "dirty"}

# .delete_if is a destructive method, so re-declaring the same array and hash
# from lines 40-46
sample_ary = ["a", "b", "c", "d", "e"]
sample_hash = {
  sky: "blue",
  sea: "green",
  trees: "tall",
  dirt: "dirty"
}

# Print the modified data to see how it changes the array and hash.
puts "Modified data: #keep_if"
p sample_ary.keep_if { |letter| letter > "d" }
p sample_hash.keep_if { |key, value| value == "dirty" }


# .keep_if is a destructive method, so re-declaring the same array and hash
# from lines 40-46
sample_ary = ["a", "b", "c", "d", "e"]
sample_hash = {
  sky: "blue",
  sea: "green",
  trees: "tall",
  dirt: "dirty"
}

# Print the modified data to see how it changes the array and hash.
puts "Modified data: #select"
p sample_ary.select { |letter| letter > "d" }
p sample_hash.select { |key, value| value == "dirty" }

puts "Modified data: #reject"
p sample_ary.reject { |letter| letter > "d" }
p sample_hash.reject { |key, value| value == "dirty" }

# .select and .reject are not destructive methods so we do not need to 
# declare the sample array an hash again.

puts "Modified data: #drop_while"
p sample_ary.drop_while { |letter| letter < "d"}
# could not find an equivalent method for a hash





