void main() {
  // List of daily temperatures
  List<double> temperatures = [72.5, 75.0, 68.0, 70.5, 73.0, 78.0, 74.5];

  // Calculate average temperature
  double averageTemp = calculateAverageTemperature(temperatures);

  // Find days above average temperature
  List<double> aboveAverageDays = findAboveAverageDays(temperatures, averageTemp);

  // Print the average temperature and days above average
  print('Average Temperature: $averageTemp°F');
  print('Days Above Average:');
  for (var temp in aboveAverageDays) {
    print('- $temp°F');
  }
}

// Method to calculate the average temperature
double calculateAverageTemperature(List<double> temps) {
  double total = temps.reduce((a, b) => a + b);
  return total / temps.length;
}

// Method to find days with temperatures above average
List<double> findAboveAverageDays(List<double> temps, double averageTemp) {
  return temps.where((temp) => temp > averageTemp).toList();
}
