var colors = ["blue", "gold", "grey", "silver"];
var names = ["Joey", "Frank", "Susan", "Jeffrey"];

colors.push("turquoise");
names.push("Jimmy");

//console.log(colors);
//console.log(names);

var horseColors = {};

for (var i = 0; i < colors.length; i++) {
  var propertyName = colors[i];
  horseColors[propertyName] = names[i];
}

console.log(horseColors);


function Car (make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;

  this.horn = function() {
    console.log("beeeeeeep!");
  };

}

var someCar = new Car("cherokee", "jeep", 1990);
console.log(someCar);
someCar.horn();

var anotherCar = new Car("tundra", "toyota", 2015);
var andAnother = new Car("civic", "honda", 2000);
console.log(anotherCar);
console.log(andAnother);