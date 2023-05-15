package cars

// unityCost is the cost of a car produced individually.
const unityCost uint = 10000

// tenCost is the cost of 10 cars produced together.
const tenCost uint = 95000

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return float64(productionRate) * successRate / 100.0
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	return int(CalculateWorkingCarsPerHour(productionRate, successRate) / 60.0)
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
	var tens int = carsCount / 10
	var unities int = carsCount % 10

	return uint(tens)*tenCost + uint(unities)*unityCost
}
