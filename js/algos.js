// Release 0
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

// Release 1
// a function that takes two objects, obj1 and obj2
// loop through the properties of obj1
  // compare each property to obj2's properties
  // if there is a match, var match = true
    // if match = true, compare the values of the properties
    // if they are equal, function returns true
// otherwise, function returns false

function shareProps(obj1, obj2) {
  var match = false;
// when verifying code with JShint, I get this message:
// "The body of a for in should be wrapped in an if statement to 
// filter unwanted properties from the prototype.""
  for (var prop1 in obj1) {
    for (var prop2 in obj2) {
      if (prop1 === prop2) {
        if (obj1[prop1] === obj2[prop2]) {
          match = true;
        }
      }
    }
  }
  return console.log(match);
}


// Driver Code
var testArray = ["one", "to", "three"];
longestChecker(testArray);

var anotherArray = ["long phrase", "longest phrase", "longer phrase"];
longestChecker(anotherArray);

var someObject = {name: "Jeff", age: 55, date: "today"};
var otherObject = {brand: "Jeep", age: 54};
console.log("Test case 1: Should be false");
shareProps(someObject, otherObject);

var thirdObject = {name: "Steve", age: 100, date: "today"};
console.log("Test case 2: should be true");
shareProps(someObject, thirdObject);

