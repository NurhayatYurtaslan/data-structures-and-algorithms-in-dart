void main() {
  // Sample sentence
  String sentence = 'this is a simple sentence with some simple words';

  // Split the sentence into words
  List<String> words = sentence.split(' ');

  // Create a map to count word frequencies
  Map<String, int> wordFrequency = {};

  // Count the frequency of each word
  for (var word in words) {
    if (wordFrequency.containsKey(word)) {
      wordFrequency[word] = wordFrequency[word]! + 1;
    } else {
      wordFrequency[word] = 1;
    }
  }

  // Print word frequencies
  print('Word Frequencies:');
  wordFrequency.forEach((word, frequency) {
    print('$word: $frequency');
  });
}
