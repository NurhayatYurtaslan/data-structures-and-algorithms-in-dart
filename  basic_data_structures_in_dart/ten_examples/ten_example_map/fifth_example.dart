void main() {
  // Sample string
  String text = 'hello world';

  // Map to store character frequency
  Map<String, int> charFrequency = {};

  // Count the frequency of each character
  for (var char in text.split('')) {
    if (charFrequency.containsKey(char)) {
      charFrequency[char] = charFrequency[char]! + 1;
    } else {
      charFrequency[char] = 1;
    }
  }

  // Print character frequencies
  print('Character Frequencies:');
  charFrequency.forEach((char, frequency) {
    print('$char: $frequency');
  });
}
