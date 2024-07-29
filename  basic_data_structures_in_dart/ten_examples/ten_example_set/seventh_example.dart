void main() {
  // List of integers
  List<int> numbers = [2, 3, 1, 5, 4, 7, 6, 8];

  // Target sum to find pairs
  int targetSum = 9;

  // Find pairs with the given target sum
  List<Pair> pairs = findPairsWithSum(numbers, targetSum);

  // Print the pairs
  print('Pairs with sum $targetSum:');
  for (var pair in pairs) {
    print('- (${pair.first}, ${pair.second})');
  }
}

// Pair class to hold a pair of numbers
class Pair {
  final int first;
  final int second;

  Pair(this.first, this.second);
}

// Function to find pairs with a specific sum
List<Pair> findPairsWithSum(List<int> numbers, int targetSum) {
  Set<int> seen = {};
  List<Pair> pairs = [];

  for (var number in numbers) {
    int complement = targetSum - number;
    if (seen.contains(complement)) {
      pairs.add(Pair(complement, number));
    }
    seen.add(number);
  }

  return pairs;
}
