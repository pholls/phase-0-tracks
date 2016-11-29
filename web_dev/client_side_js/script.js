console.log('Script is running!')

var list = document.getElementsByTagName('li');
console.log(list);
for (var i = 0; i < list.length; i++) {
  list[i].style.color = 'blue';
}
