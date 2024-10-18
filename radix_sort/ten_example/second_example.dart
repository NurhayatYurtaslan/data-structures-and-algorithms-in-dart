void countingSort(List<int> arr, int exp) {
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

void radixSort(List<int> arr) {
  int max = arr.reduce((a, b) => a > b ? a : b);

  for (int exp = 1; max ~/ exp > 0; exp *= 10) {
    countingSort(arr, exp);
  }
}

void main() {
  List<int> sortedNumbers = [12, 34, 56, 78, 90];

  print("Before sorting:");
  print(sortedNumbers);

  radixSort(sortedNumbers);

  print("After sorting:");
  print(sortedNumbers);
}