void main() {
  // Create a set of integers
  Set<int> numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

  // Remove even numbers from the set
  removeIf(numbers, (num) => num.isEven);

  // Print the modified set
  print('Set after removing even numbers:');
  for (var number in numbers) {
    print('- $number');
  }
}

// Function to remove elements that match a condition
void removeIf<T>(Set<T> set, bool Function(T) condition) {
  set.removeWhere(condition);
}
