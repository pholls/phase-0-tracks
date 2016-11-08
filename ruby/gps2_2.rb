# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # 1. get input
  # 2. use .split to separate the items on the list by the spaces
  # 3. the items will be separated into a array, iteriate over the array to put items into hash
  # 4. set default quantity to 1
  # 5. print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

# Method to add an item to a list
# input: item name and optional quantity
# steps:
# output:

# Method to remove an item from the list
# input:
# steps:
# output:

# Method to update the quantity of an item
# input:
# steps:
# output:

# Method to print a list and make it look pretty
# input:
# steps:
# output:

def create_list(list)
  gocery_list = {}
  list = list.split(" ")
  list.each do |item|
    gocery_list[item] = 1
  end
  print_list(gocery_list)
end

def add_item(item,list={},quantity=1)
  list[item] = quantity 
  p list 
end

def remove_item(item,list)
  list.delete(item) 
  p list 
end

def update_item(item,list={},quantity=1)
  list[item] = quantity 
  p list 
end
def print_list(list)
  list.each do |item,quantity|
    puts "You need #{quantity} of #{item}."
  end
end

list1 = create_list("carrots apples cereal pizza")

add_item("pineapples",list1,50)

remove_item("carrots",list1)

update_item("pineapples",list1,150)

print_list(list1)