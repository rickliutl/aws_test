package main
import 
("fmt"
"time"
)

func main() {
  fmt.Println("hello world")
  fmt.Println("1+1 =", 1+1)
  fmt.Println("7.0/3.0 =", 7.0/3.0)
  fmt.Println(true && false)
  fmt.Println(true || false)
  fmt.Println(!true)
  for {
    fmt.Println("alive..")
    time.Sleep(time.Second * 5)
  }
}
