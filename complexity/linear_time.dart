void printNames(List<String> names) {
  for (final name in names) {
    print(name);
  }
}

void main() {
  // First list with 5 elements
  List<String> names1 = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];

  // Second list with 10 elements
  List<String> names2 = [
    'Alice', 'Bob', 'Charlie', 'David', 'Eve', 
    'Frank', 'Grace', 'Hannah', 'Ivy', 'Jack'
  ];

  // Measure execution time for the first list using Stopwatch
  Stopwatch stopwatch1 = Stopwatch()..start();
  print('Names in the first list:');
  printNames(names1);
  stopwatch1.stop();
  print('Execution time for the first list: ${stopwatch1.elapsedMicroseconds} microseconds');

  // Measure execution time for the second list using Stopwatch
  Stopwatch stopwatch2 = Stopwatch()..start();
  print('\nNames in the second list:');
  printNames(names2);
  stopwatch2.stop();
  print('Execution time for the second list: ${stopwatch2.elapsedMicroseconds} microseconds');
}
