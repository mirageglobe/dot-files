// === go

// === references
// - https://devhints.io/go

// === basic commands

// === === array

var balance [10]float32
var balance = [5]float32{1000.0, 2.0, 3.4, 7.0, 50.0}

// === === class

// === === function

func max(num1, num2 int) int {
  /* local variable declaration */
  result int

  if (num1 > num2) {
    result = num1
  } else {
    result = num2
  }
  return result
}

// multiple variable returns
func swap(x, y string) (string, string) {
   return y, x
}

func main() {
   a, b := swap("First", "Second")
   fmt.Println(a, b)
}

// === === if

// === === loop

// for loop
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

// === === regex

// === === switch

// === === variable

var  i, j, k int;
var  c, ch byte;
var  f, salary float32;
d =  42;

// === helper commands

// === === type conversions

// === === string functions

// === === numeric functions

// === === ranges short cut

// === === threads
