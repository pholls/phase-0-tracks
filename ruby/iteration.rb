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