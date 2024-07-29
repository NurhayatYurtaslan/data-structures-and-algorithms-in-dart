void main() {
  // Sample text
  String text = '''
  Dart is an open-source, general-purpose programming language. Dart is
  originally developed by Google. Dart is used to build web, server, and
  mobile applications.
  ''';

  // Analyze word frequencies
  Map<String, int> wordFrequencies = analyzeWordFrequencies(text);

  // Print word frequencies
  print('Word Frequencies:');
  wordFrequencies.forEach((word, frequency) {
    print('- $word: $frequency');
  });
}

// Function to analyze word frequencies
Map<String, int> analyzeWordFrequencies(String text) {
  // Split text into words and remove punctuation
  List<String> words = text
      .toLowerCase()
      .replaceAll(RegExp(r'[^\w\s]'), '')
      .split(RegExp(r'\s+'));

  // Use a set to store unique words
  Set<String> uniqueWords = words.toSet();

  // Use a map to store word frequencies
  Map<String, int> frequencies = {};

  // Count the frequency of each word
  for (var word in uniqueWords) {
    frequencies[word] = words.where((w) => w == word).length;
  }

  return frequencies;
}
