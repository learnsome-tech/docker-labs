package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("task worker ready")
	fmt.Println("queue:", os.Getenv("QUEUE"))
}
