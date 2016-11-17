// function will take a string as an argument
// look at the last character of the string
  // add that to a new string, then look at second-to-last character
  // do this for each character
  // return the new string


function reverse(string) {
  var newString = "";
  for (var i = string.length - 1; i >= 0; i--) {
    newString += string[i];
  }
  return newString;
}

var olleh = reverse("hello");
var hturt = reverse("truth");

if (1 == 1) {
  console.log(olleh);
  console.log(hturt);
}