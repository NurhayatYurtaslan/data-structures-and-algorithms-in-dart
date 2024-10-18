import 'dart:math';

void radixSortBase(List<int> arr, int base) {
  int max = arr.reduce((a, b) => a > b ? a : b);
  for (int exp = 1; max ~/ exp > 0; exp *= base) {
    _countingSort(arr, exp, base);
  }
}

void _countingSort(List<int> arr, int exp, int base) {
  int n = arr.length;
  List<int> output = List.filled(n, 0);
  List<int> count = List.filled(base, 0);

  for (int i = 0; i < n; i++) {
    int index = (arr[i] ~/ exp) % base;
    count[index]++;
  }

  for (int i = 1; i < base; i++) {
    count[i] += count[i - 1];
  }

  for (int i = n - 1; i >= 0; i--) {
    int index = (arr[i] ~/ exp) % base;
    output[count[index] - 1] = arr[i];
    count[index]--;
  }

  for (int i = 0; i < n; i++) {
    arr[i] = output[i];
  }
}

void main() {
  List<int> decimalNumbers = [170, 45, 75, 90, 802, 24, 2, 66];
  List<int> binaryNumbers = decimalNumbers.map((e) => int.parse(e.toRadixString(2))).toList();
  List<int> hexNumbers = decimalNumbers.map((e) => int.parse(e.toRadixString(16))).toList();

  print("Before sorting (Binary):");
  print(binaryNumbers);

  radixSortBase(binaryNumbers, 2);

  print("After sorting (Binary):");
  print(binaryNumbers);

  print("Before sorting (Hexadecimal):");
  print(hexNumbers);

  radixSortBase(hexNumbers, 16);

  print("After sorting (Hexadecimal):");
  print(hexNumbers);
}
