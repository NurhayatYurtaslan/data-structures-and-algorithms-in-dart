void main() {
  // Create a map of country codes to country names
  Map<String, String> countryCodes = {
    'US': 'United States',
    'DE': 'Germany',
    'JP': 'Japan',
    'TR': 'Turkey',
  };

  // Access and print a specific country name by code
  String code = 'JP';
  if (countryCodes.containsKey(code)) {
    print('Country with code $code: ${countryCodes[code]}');
  } else {
    print('Country code $code not found.');
  }

  // Print all country codes and names
  print('All country codes and names:');
  countryCodes.forEach((code, name) {
    print('-$code: $name');
  });
}
