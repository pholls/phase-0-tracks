// function that takes array of strings and returns the longest one
// loop over the array
// var longestWord == ''
// if index == 0, var previousLength == 0
// otherwise, previousLength == currentLength
// call .length on current index
// update currentLength
// if currentLength > previousLength, update longestWord to the current String
// otherwise, skip that step
// return longestWord

function sortArray(array) {
  for (var i = array.length - 1; i >= 0; i--) {
    console.log(array[i]);
  }
}
var testArray = ["one", "two", "three"];
sortArray(testArray);
