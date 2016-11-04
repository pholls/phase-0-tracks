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

array = [42, 89, 23, 1]

p search_array(array, 9)