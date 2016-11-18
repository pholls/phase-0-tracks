// function that takes array of strings and returns the longest one
// loop over the array
// var longestWord = ''
// if index === 0, var previousLength = 0
// otherwise, previousLength = currentLength
// call .length on current index
// update currentLength
// if currentLength > previousLength, update longestWord to the current String
// otherwise, skip that step
// return longestWord

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

function sortArray(array) {
  var longestWord = '';
  var previousLength = 0;
  var currentLength = 0;
  for (var i = 0; i <= array.length - 1; i++) {
    if (i !== 0) {
      previousLength = currentLength;
    }
    currentLength = array.length;
    if (currentLength > previousLength) {
      longestWord = array[i];
    }
    // console.log(array[i]);
  }
  return longestWord;
}

var testArray = ["one", "to", "three"];
console.log(sortArray(testArray));
