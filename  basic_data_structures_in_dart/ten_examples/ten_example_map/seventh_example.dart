void main() {
  // Original map with city and country pairs
  Map<String, String> cityCountryMap = {
    'New York': 'USA',
    'Berlin': 'Germany',
    'Tokyo': 'Japan',
    'Istanbul': 'Turkey',
  };

  // Map to store the inverted key-value pairs
  Map<String, String> invertedMap = {};

  // Invert the map
  cityCountryMap.forEach((city, country) {
    invertedMap[country] = city;
  });

  // Print the inverted map
  print('Inverted Map (Country to City):');
  invertedMap.forEach((country, city) {
    print('$country: $city');
  });
}
