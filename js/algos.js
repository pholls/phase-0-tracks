// take an array of strings
// var currentLength = 0
// var longestIndex = 0
// loop over items
// call array[i].length on each one
// if currentLength < array[i].length
// (that is, if the current string is longer than the previous one)
  // update the current length to the length of the current string
  // update longestIndex to the current index 
  // longestIndex = i
// return array[longestIndex]

function longestChecker(array) {
  var currentLength = 0;
  var longestIndex = 0;
  for (var i = 0; i <= array.length - 1; i++) {
    if (currentLength < array[i].length) {
      currentLength = array[i].length;
      longestIndex = i;
    }
  }
  return console.log(array[longestIndex]);
}

// a function that takes two objects, obj1 and obj2
// loop through the properties of obj1
  // compare the properties to obj2's
  // if there is a match, var match = true
    // if match = true, compare the values of the properties
    // if they are equal, function returns true
// otherwise, function returns false

var testArray = ["one", "to", "three"];
longestChecker(testArray);

var anotherArray = ["long phrase", "longest phrase", "longer phrase"];
longestChecker(anotherArray);
