// === go

// === references
// - https://devhints.io/go

// === basic commands

// === === array

numbers := [...]int{0, 0, 0, 0, 0}

var balance [10]float32
var balance = [5]float32{1000.0, 2.0, 3.4, 7.0, 50.0}

// === === class

// === === function

func main() {
  message := greetMe("world")
  fmt.Println(message)
}

func max(num1, num2 int) int {
  /* local var declaration */
  result int

  if (num1 > num2) {
    result = num1
  } else {
    result = num2
  }
  return result
}

// multiple var returns
func swap(x, y string) (string, string) {
   return y, x
}

func main() {
   a, b := swap("First", "Second")
   fmt.Println(a, b)
}

// === === if

if day == "sunday" || day == "saturday" {
  rest()
} else if day == "monday" && isTired() {
  groan()
} else {
  work()
}

// === === loop

// for loop
for count := 0; count <= 10; count++ {
  fmt.Println("My counter is at", count)
}

for a := 0; a < 10; a++ {
  fmt.Printf("value of a: %d\n", a)
}

for a < b {
  a++
  fmt.Printf("value of a: %d\n", a)
}

for i,x:= range numbers {
  fmt.Printf("value of x = %d at %d\n", x,i)
}

// === === print

import (
    "fmt"
)

fmt.Printf("hello")

// === === regex

import (
    "fmt"
    "regexp"
)

func main() {
    re := regexp.MustCompile("ck$")
    fmt.Println(re.FindString("hack"))
    fmt.Println(re.FindString("cricket"))
}

// === === switch

switch day {
  case "sunday":
    // cases don't "fall through" by default!
    fallthrough

  case "saturday":
    rest()

  default:
    work()
}

// === === variable

// basic declaration
var msg string
msg = "Hello"

// similar declaration (infers type)
msg := "Hello"

// multiline string
str := `Multiline
string`

var  i, j, k int;
var  c, ch byte;
var  f, salary float32;
d =  42;

// === helper commands

// === === type conversions

i := 2
f := float64(i)
u := uint(i)

// === === string functions

// === === numeric functions

// === === ranges short cut

// === === threads

func main() {
  // A "channel"
  ch := make(chan string)

  // Start concurrent routines
  go push("Moe", ch)
  go push("Larry", ch)
  go push("Curly", ch)

  // Read 3 results
  // (Since our goroutines are concurrent,
  // the order isn't guaranteed!)
  fmt.Println(<-ch, <-ch, <-ch)
}

func push(name string, ch chan string) {
  msg := "Hey, " + name
  ch <- msg
}
