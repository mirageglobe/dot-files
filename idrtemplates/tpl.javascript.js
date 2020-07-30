// #!/usr/bin/env node

// this is a javascript template for quick start.

// good references can be found:
// - https://devhints.io/es6
// - https://www.w3schools.com/js/js_es6.asp

// check compatibility table as there is es2015 es2016 es2017 es2018
// - http://kangax.github.io/compat-table/es2016plus/

// recommended use
// - es6 (es2016)
// - node 12.x.x +

// === basic commands ===

// "use strict"; // add this to beginning of script; this forces js to be executed in strict mode; where all variables must be declared
//
// styles
// - camelCase (variables/function names)
// - UPPERCASE (global constants/constants)
// - data-quantity (html5 attributes)
// - font-size (css)
//
// always lower case file names : my-file.jpg

// print
// javascript has five ways to print; with the fifth commonly used for debugging
// ```
// method 1 via innerhtml
//
// <p id="demo"></p>
// <script>document.getElementById("demo").innerHTML = 5 + 6;</script>
//
// method 2 via doc write
// <script>document.write(5 + 6);</script>
//
// method 3 overwrite after html is loaded
// <p>My first paragraph.</p>
// <button type="button" onclick="document.write(5 + 6)">Try it</button>
//
// method 4 via alerts
// <script>window.alert(5 + 6);</script>
//
// method 5 via dom console log
// <script>console.log("my message");</script>
// ```

// variables and contants
//
// ```
// var myVariable = "something";
// let myVariable = "something else";                 // from es6 (2015); this value can be declared in sub blocks without changing parent script
// const MYCONST = "a value that cannot be changed"   // similar to let but fixed value
// ```

// arrays
//
// ```
// var cars = ["saab", "volvo", "bmw"];
// ```

// if conditionals
//
// ```
// if (condition) {
// } else {
// }
// ```

// switch case conditions
//
// ```
// switch(expression) {
//   case x:
//     code block
//     break;
//   case y:
//     code block
//     break;
//   default:
//     code block
// }
// ```

// loops while
//
// ```
// while (condition) {  }
// ```

// for each item loop
//
// ```
// var i;
// for (i = 0; i < cars.length; i++) { text += cars[i] + "<br>"; }
// ```

// function
//
// ```
// function toCelsius(fahrenheit = 10) {
//   // es6 allows default values
//   return (5 / 9) * (fahrenheit - 32);
// }
// ```

// class
//
// ```
// var person = new Object();
// person.firstName = "john";
//
// var person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
// ```

// classes constructors destructors
//
// constructor functions with an upper-case first letter.
//
// ```
// function Person(first, last, age, eye) {
//   this.firstName = first;
//   this.lastName = last;
//   this.age = age;
//   this.eyeColor = eye;
// }
// ```

// classes inheritance extensions
//
// ```
// function Person(first, last, age, eyecolor) {
//   this.firstName = first;
//   this.lastName = last;
// }
//
// Person.prototype.nationality = "English";        // adding a new property to object
//
// Person.prototype.name = function() {             // adding a new function to object
//   return this.firstName + " " + this.lastName;
// };
// ```

// === helper commands ===

// debugging via breakpoints and chrome inspect
//
// ```
// var x = 15 * 5;
// debugger;
// document.getElementById("demo").innerHTML = x;
//
// console.log("some issue issue");
// ```

// regular expressions
//
// ```
// ```

// threads - used to assign multi-threading
//
// ```
// ```

// numeric functions
//
// ```
// ```

// string functions
//
// ```
// ```

// ranges short cut
//
// ```
// ```

// type conversions
//
// ```
// x.toString();
// (123).toString();
// Date().toString();
// ```

// function to check if array
//
// function isArray(myArray) {
//   return myArray.constructor === Array;
// }

// function to check if date
//
// function isDate(myDate) {
//   return myDate.constructor === Date;
// }

