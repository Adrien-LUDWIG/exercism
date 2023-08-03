// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Number of days in a week.
 */
const DAYS_PER_WEEK = 7;

/**
 * Calculates the total bird count.
 *
 * @param {number[]} birdsPerDay
 * @returns {number} total bird count
 */
export function totalBirdCount(birdsPerDay) {
  let count = 0;
  
  for (let day = 0; day < birdsPerDay.length; day++)
    count += birdsPerDay[day];

  return count;
}

/**
 * Calculates the total number of birds seen in a specific week.
 *
 * @param {number[]} birdsPerDay
 * @param {number} week
 * @returns {number} birds counted in the given week
 */
export function birdsInWeek(birdsPerDay, week) {
  let count = 0;
  let startDay = (week - 1) * DAYS_PER_WEEK;
  let endDay = week * DAYS_PER_WEEK;
  
  for (let day = startDay; day < endDay; day++)
    count += birdsPerDay[day];

  return count;
}

/**
 * Fixes the counting mistake by increasing the bird count
 * by one for every second day.
 *
 * @param {number[]} birdsPerDay
 * @returns {number[]} corrected bird count data
 */
export function fixBirdCountLog(birdsPerDay) {
  for (let day = 0; day < birdsPerDay.length; day += 2)
    birdsPerDay[day]++;
  
  return birdsPerDay;
}
