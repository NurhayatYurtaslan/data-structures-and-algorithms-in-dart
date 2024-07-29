void main() {
  // Create a set of integers
  Set<int> numbers = {1, 2, 3};

  // Find all subsets of the set
  List<Set<int>> subsets = findSubsets(numbers);

  // Print all subsets
  print('Subsets:');
  for (var subset in subsets) {
    print('- $subset');
  }
}

// Function to find all subsets of a set
List<Set<T>> findSubsets<T>(Set<T> originalSet) {
  List<Set<T>> subsets = [];
  int setSize = originalSet.length;

  for (int i = 0; i < (1 << setSize); i++) {
    Set<T> subset = {};
    int index = 0;

    for (var element in originalSet) {
      if (i & (1 << index) != 0) {
        subset.add(element);
      }
      index++;
    }

    subsets.add(subset);
  }

  return subsets;
}
