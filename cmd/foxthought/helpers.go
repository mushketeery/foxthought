package main

import (
	"fmt"
	"strings"
)

// validateArgsLength checks that the number of arguments is not greater than 1.
func validateArgsLength(args []string) error {
	if len(args) > 1 {
		return fmt.Errorf("Too many thoughts...")
	}

	return nil
}

// extractThought returns the first argument string if it exists, else defaulting.
func extractThought(args []string, defaultThought string) string {
	if len(args) == 0 {
		return defaultThought
	}

	return args[0]
}

// wrapThought places a string into a thought bubble format.
func wrapThought(thought string) string {
	thoughtLength := len(thought)

	var thoughtBubble string
	thoughtBubble += "  " + strings.Repeat("-", thoughtLength) + "\n" // top part
	thoughtBubble += "< " + thought + " >\n"                          // thought part
	thoughtBubble += "  " + strings.Repeat("-", thoughtLength) + "\n" // bottom part
	thoughtBubble += "    O\n      o"                                 // bubbles

	return thoughtBubble
}
