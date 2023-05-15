package techpalace

import "strings"

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	var starLine string = strings.Repeat("*", numStarsPerLine)
	return starLine + "\n" + welcomeMsg + "\n" + starLine
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	var newMsg string = strings.Replace(oldMsg, "*", "", -1)
	newMsg = strings.TrimSpace(newMsg)
	return newMsg
}
