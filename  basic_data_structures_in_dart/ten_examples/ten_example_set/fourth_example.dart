void main() {
  // Create two sets of strings
  Set<String> setA = {'apple', 'banana', 'cherry', 'date'};
  Set<String> setB = {'banana', 'date', 'fig', 'grape'};

  // Calculate the symmetric difference
  Set<String> symmetricDifference = findSymmetricDifference(setA, setB);

  // Print the symmetric difference
  print('Symmetric Difference:');
  for (var item in symmetricDifference) {
    print('- $item');
  }
}

// Function to calculate the symmetric difference between two sets
Set<T> findSymmetricDifference<T>(Set<T> setA, Set<T> setB) {
  return (setA.difference(setB)).union(setB.difference(setA));
}
