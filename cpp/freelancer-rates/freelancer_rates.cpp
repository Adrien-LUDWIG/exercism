#include <cmath>

int HOURS_PER_DAY{8};    // Billable hours
int DAYS_PER_MONTH{22};  // Billable days

// daily_rate calculates the daily rate given an hourly rate
double daily_rate(double hourly_rate) { return hourly_rate * HOURS_PER_DAY; }

// apply_discount calculates the price after a discount
double apply_discount(double before_discount, double discount) {
    double new_price_coefficient = (100. - discount) / 100.;
    return before_discount * new_price_coefficient;
}

// discounted_daily_rate calculates the daily rate given an hourly rate and
// applies a discount.
double discounted_daily_rate(double hourly_rate, double discount) {
    return apply_discount(daily_rate(hourly_rate), discount);
};

// monthly_rate calculates the monthly rate, given an hourly rate and a discount
// The returned monthly rate is rounded up to the nearest integer.
int monthly_rate(double hourly_rate, double discount) {
    return ceil(discounted_daily_rate(hourly_rate, discount) * DAYS_PER_MONTH);
}

// days_in_budget calculates the number of workdays given a budget, hourly rate,
// and discount The returned number of days is rounded down (take the floor) to
// the next integer.
int days_in_budget(int budget, double hourly_rate, double discount) {
    return floor(budget / discounted_daily_rate(hourly_rate, discount));
}