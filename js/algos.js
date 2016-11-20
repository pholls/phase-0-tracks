// Release 0 Pseudocode
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
  return array[longestIndex];
}

// Release 1 Pseudocode
// a function that takes two objects, obj1 and obj2
// loop through the properties of obj1
  // compare each property to obj2's properties
  // if there is a match, var match = true
    // if match = true, compare the values of the properties
    // if they are equal, function returns true
// otherwise, function returns false

function shareProps(obj1, obj2) {
  var match = false;
// when verifying code with JSHint, I get this message:
// "The body of a for in should be wrapped in an if statement to 
// filter unwanted properties from the prototype."
// I don't fully understand the prototype thing.
  for (var prop1 in obj1) {
    for (var prop2 in obj2) {
      if (prop1 === prop2) {
        if (obj1[prop1] === obj2[prop2]) {
          match = true;
        }
      }
    }
  }
  return match;
}

// Release 2 Pseudocode
// function will take one argument: an integer (call it n)
// initialize with an empty array
  // array = []
// create an array such that array.length = n
// populate the array with strings of random letters
  // "abcdefghijklmnopqrstuvwxyz" at a random index
  // each string is between 1 and 10 letters (randomly generated)
  // do this n number of times
// return the array

function randomNumber(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

function randomizeArray(n) {
  var array = [];
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  for (var i = 0; i < n; i++) {
    var wordLength = randomNumber(1, 10);
    var string = "";
    for (var j = 0; j <= wordLength; j++) { 
      var randomIndex = randomNumber(0, 25);
      string += alphabet[randomIndex];
    }
    array.push(string);
  }
  return array;
}

// Driver Code
// release 0
console.log('Release 0 tests:');

var testArray = ["one", "four", "three"];
console.log(longestChecker(testArray));

var anotherArray = ["long phrase", "longest phrase", "longer phrase"];
console.log(longestChecker(anotherArray));

// release 1
console.log('Release 1 tests:');

var someObject = {name: "Jeff", age: 55, date: "today"};
var otherObject = {brand: "Jeep", age: 54};
console.log("Test case 1: Should be false");
console.log(shareProps(someObject, otherObject));

var thirdObject = {name: "Steve", age: 100, date: "today"};
console.log("Test case 2: should be true");
console.log(shareProps(someObject, thirdObject));

// release 2
console.log('Release 2 tests:');

console.log(randomizeArray(3));

for (var i = 0; i < 10; i++) {
  var newArray = randomizeArray(randomNumber(1,10));
  var longestWord = longestChecker(newArray);
  console.log("The longest word is: " + longestWord);
}
