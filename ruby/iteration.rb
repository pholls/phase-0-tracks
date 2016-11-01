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