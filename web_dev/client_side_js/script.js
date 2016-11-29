console.log('Script is running!')

var list = document.getElementsByTagName('li');
console.log(list);
for (var i = 0; i < list.length; i++) {
  list[i].style.color = 'blue';
}

function colorToRed(event) {
  event.target.style.color = 'red';
}

function colorToBlack(event) {
  event.target.style.color = 'black';
}

var h1 = document.getElementById('header');
h1.addEventListener('click', colorToRed);
h1.addEventListener('mouseout', colorToBlack);

var h2 = document.getElementById('header 2');
h2.addEventListener('mouseover', colorToRed);
h2.addEventListener('mouseout', colorToBlack);

var paragraph = document.getElementsByTagName('p');
for (var i = 0; i < paragraph.length; i++) {
  paragraph[i].addEventListener('click', colorToRed);
}

function hideElement(event) {
  event.target.style.visibility = 'hidden';
}

var image = document.getElementsByTagName('img')[0];
image.addEventListener('click', hideElement);
