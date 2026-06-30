package main

import (
	"fmt"
	"os"
)

func main() {
	// os.Args[0] is the program name, so get proper arguments
	arguments := os.Args[1:]

	// check for correct number of arguments
	err := validateArgsLength(arguments)
	if err != nil {
		fmt.Printf("\u001B[33m[Error]\u001B[0m %v\n", err)
		os.Exit(1)
	}

	// get argument string and wrap in bubble (defaults to "Oofity Loofity!")
	thought := wrapThought(extractThought(arguments, "Oofity Loofity!"))

	// print thought and fox
	fmt.Println(thought)
	fmt.Println(fox)
}
