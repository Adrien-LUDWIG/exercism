const int OVEN_TIME{40};
const int PREPARATION_TIME_BY_LAYER{2};

// ovenTime returns the amount in minutes that the lasagna should stay in
// the oven.
int ovenTime() { return OVEN_TIME; }

/* remainingOvenTime returns the remaining
   minutes based on the actual minutes already in the oven.
*/
int remainingOvenTime(int actualMinutesInOven) {
  return OVEN_TIME - actualMinutesInOven;
}

/* preparationTime returns an estimate of the preparation time based on the
   number of layers and the necessary time per layer.
*/
int preparationTime(int numberOfLayers) {
  return numberOfLayers * PREPARATION_TIME_BY_LAYER;
}

// elapsedTime calculates the total time spent to create and bake the lasagna so
// far.
int elapsedTime(int numberOfLayers, int actualMinutesInOven) {
  return preparationTime(numberOfLayers) + actualMinutesInOven;
}
