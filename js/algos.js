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

var testArray = ["one", "to", "three"];
longestChecker(testArray);

var anotherArray = ["long phrase", "longest phrase", "longer phrase"];
longestChecker(anotherArray);
