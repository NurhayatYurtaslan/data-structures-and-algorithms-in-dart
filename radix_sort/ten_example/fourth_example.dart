void radixSort(List<int> arr) {
  List<int> positivePart = arr.where((x) => x >= 0).toList();
  List<int> negativePart = arr.where((x) => x < 0).map((x) => -x).toList();

  _radixSort(positivePart);
  _radixSort(negativePart);

  negativePart = negativePart.map((x) => -x).toList();
  negativePart = negativePart.reversed.toList();

  arr
    ..clear()
    ..addAll(negativePart)
    ..addAll(positivePart);
}

void _radixSort(List<int> arr) {
  int max = arr.reduce((a, b) => a > b ? a : b);

  for (int exp = 1; max ~/ exp > 0; exp *= 10) {
    _countingSort(arr, exp);
  }
}

void _countingSort(List<int> arr, int exp) {
  int n = arr.length;
  List<int> output = List.filled(n, 0);
  List<int> count = List.filled(10, 0);

  for (int i = 0; i < n; i++) {
    int index = (arr[i] ~/ exp) % 10;
    count[index]++;
  }

  for (int i = 1; i < 10; i++) {
    count[i] += count[i - 1];
  }

  for (int i = n - 1; i >= 0; i--) {
    int index = (arr[i] ~/ exp) % 10;
    output[count[index] - 1] = arr[i];
    count[index]--;
  }

  for (int i = 0; i < n; i++) {
    arr[i] = output[i];
  }
}

void main() {
  List<int> numbers = [170, -45, 75, -90, 802, 24, -2, 66];

  print("Before sorting:");
  print(numbers);

  radixSort(numbers);

  print("After sorting:");
  print(numbers);
}
