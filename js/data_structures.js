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

var someCar = new Car("Jeep", "Cherokee", 1990);
console.log(someCar.make + " " + someCar.model + " goes beep beep!");
someCar.horn();

var anotherCar = new Car("Toyota", "Tundra", 2015);
var andAnother = new Car("Honda", "Civic", 2000);
console.log(anotherCar.make + " " + anotherCar.model + " can honk:");
anotherCar.horn();
// console.log(andAnother);
console.log(andAnother.make + " " + andAnother.model + " can honk too:");
andAnother.horn();
