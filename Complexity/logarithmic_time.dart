bool betterNaiveContains(int value, List<int> list) {
  if (list.isEmpty) return false;

  final middleIndex = list.length ~/ 2;

  if (value > list[middleIndex]) {
    // Search the right half
    for (var i = middleIndex + 1; i < list.length; i++) {
      if (list[i] == value) return true;
    }
  } else {
    // Search the left half
    for (var i = middleIndex; i >= 0; i--) {
      if (list[i] == value) return true;
    }
  }
  
  return false;
}

void main() {
  List<int> numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];

  // Define targets to search for
  int target1 = 80;
  int target2 = 100;

  // Measure execution time for searching target1
  Stopwatch stopwatch1 = Stopwatch()..start();
  bool result1 = betterNaiveContains(target1, numbers);
  stopwatch1.stop();
  print('Does the list contain $target1? $result1');
  print('Execution time for target $target1: ${stopwatch1.elapsedMicroseconds} microseconds');

  // Measure execution time for searching target2
  Stopwatch stopwatch2 = Stopwatch()..start();
  bool result2 = betterNaiveContains(target2, numbers);
  stopwatch2.stop();
  print('Does the list contain $target2? $result2');
  print('Execution time for target $target2: ${stopwatch2.elapsedMicroseconds} microseconds');
}
