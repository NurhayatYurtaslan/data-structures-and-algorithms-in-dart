void radixSortFloat(List<double> arr) {
  List<int> intParts = arr.map((e) => (e * 1000).round()).toList();
  
  int max = intParts.reduce((a, b) => a > b ? a : b);
  for (int exp = 1; max ~/ exp > 0; exp *= 10) {
    _countingSort(intParts, exp);
  }

  for (int i = 0; i < arr.length; i++) {
    arr[i] = intParts[i] / 1000;
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
  List<double> numbers = [12.345, 67.890, 1.234, 56.789, 123.456];

  print("Before sorting:");
  print(numbers);

  radixSortFloat(numbers);

  print("After sorting:");
  print(numbers);
}
