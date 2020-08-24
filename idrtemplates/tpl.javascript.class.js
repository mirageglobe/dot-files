var person = new Object();
person.firstName = "john";

var person = { firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};

// constructor
function Person(first, last, age, eye) {
  this.firstName = first;
  this.lastName = last;
  this.age = age;
  this.eyeColor = eye;
}

// classes inheritance extensions
function Person(first, last, age, eyecolor) {
  this.firstName = first;
  this.lastName = last;
}

Person.prototype.nationality = "English";        // adding a new property to object

Person.prototype.name = function() {             // adding a new function to object
  return this.firstName + " " + this.lastName;
};
