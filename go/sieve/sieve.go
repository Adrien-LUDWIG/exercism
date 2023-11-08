package sieve

func Sieve(limit int) []int {
	numbers := make([]bool, limit+1)

	for index := range numbers {
		numbers[index] = true
	}

	var primes []int

	// Skip 0 and 1 which are not primes
	for number := 2; number <= limit; number++ {
		if numbers[number] {
			primes = append(primes, number)

			// Exclude numbers which have `number` as a factor
			for power := number * number; power <= limit; power += number {
				numbers[power] = false
			}
		}
	}

	return primes
}
