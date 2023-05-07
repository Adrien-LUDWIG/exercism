// Package weather forecasts the current weather condition of various cities in Goblinocus.
package weather

// CurrentCondition is a string representing the current condition used to print the forecast.
var CurrentCondition string

// CurrentLocation is a string representing the current location used to print the forecast.
var CurrentLocation string

// Forecast returns the forecast given the city of interest and the weather condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
