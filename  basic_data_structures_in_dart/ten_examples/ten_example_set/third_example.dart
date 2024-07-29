void main() {
  // Create two sets of integers
  Set<int> setA = {1, 2, 3, 4, 5};
  Set<int> setB = {4, 5, 6, 7, 8};

  // Find the intersection of the two sets
  Set<int> intersection = setA.intersection(setB);

  // Print the intersection
  print('Intersection of Set A and Set B:');
  for (var value in intersection) {
    print('- $value');
  }
}
