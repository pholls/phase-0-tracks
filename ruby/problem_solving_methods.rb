# Define an array of integers
# Iterate over the array until find the given integer
# Return index of given integer
# If not present, return nil

def search_array(array, number)
  b = nil
  for i in 0..array.length - 1
    if array[i] == number
      b = i
      break
    end
  end
  b
end

# Driver Code
array = [42, 89, 23, 1]
p search_array(array, 9)

# define a method "fib" that takes an integer as an argument
# initialize an array with [0, 1]
# create a loop that loops integer times with .times
# increment the index starting at 0
  # starting at index + index position + 1
  # push result into array
# return an array of the fibonacci numbers run that many times

def fib(number)
  index = 0
  array = [0, 1]
  (number - 2).times do
    array << array[index] + array[index + 1]
    index += 1
  end
  array
end

# Driver Code:
p fib(6)
p fib(1)
p fib(100).last == 218922995834555169026
p fib(0)

