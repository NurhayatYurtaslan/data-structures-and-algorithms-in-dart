void printMoreNames(List<String> names) {
  for (final _ in names) {
    for (final name in names) {
      print(name);
    }
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
  print('Repeated names in the first list:');
  printMoreNames(names1);
  stopwatch1.stop();
  print('Execution time for the first list: ${stopwatch1.elapsedMilliseconds} milliseconds');

  // Measure execution time for the second list using Stopwatch
  Stopwatch stopwatch2 = Stopwatch()..start();
  print('\nRepeated names in the second list:');
  printMoreNames(names2);
  stopwatch2.stop();
  print('Execution time for the second list: ${stopwatch2.elapsedMilliseconds} milliseconds');
}
