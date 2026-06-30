package main

import (
	"fmt"
	"os"
)

func main() {
	arguments := os.Args[1:] // os.Args[0] is the program name

	err := validateArgsLength(arguments)
	if err != nil {
		fmt.Printf("\u001B[33m[Error]\u001B[0m %v\n", err)
		os.Exit(1)
	}

	thought := extractThought(arguments)
	fmt.Println(thought)
}

// validateArgsLength checks that the number of arguments is not greater than 1.
func validateArgsLength(args []string) error {
	if len(args) > 1 {
		return fmt.Errorf("Too many thoughts...")
	}

	return nil
}

// extractThought returns the first argument string if it exists, else defaulting.
func extractThought(args []string) string {
	if len(args) == 0 {
		return "Oofity Loofity!"
	}

	return args[0]
}
