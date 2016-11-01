def my_method
  variable = "\"Hello, World\""
  puts "The block as not run yet."
  yield(variable)
  puts "The block has run."
end

my_method { |variable| puts "When a computer wakes up, it says #{variable}" }