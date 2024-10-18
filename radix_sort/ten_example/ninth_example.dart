void radixSortStrings(List<String> arr, int maxLength) {
  for (int pos = maxLength - 1; pos >= 0; pos--) {
    _countingSortByChar(arr, pos);
  }
}

void _countingSortByChar(List<String> arr, int pos) {
  int n = arr.length;
  List<String> output = List.filled(n, '');
  List<int> count = List.filled(256, 0);

  for (int i = 0; i < n; i++) {
    int charIndex = pos < arr[i].length ? arr[i].codeUnitAt(pos) : 0;
    count[charIndex]++;
  }

  for (int i = 1; i < 256; i++) {
    count[i] += count[i - 1];
  }

  for (int i = n - 1; i >= 0; i--) {
    int charIndex = pos < arr[i].length ? arr[i].codeUnitAt(pos) : 0;
    output[count[charIndex] - 1] = arr[i];
    count[charIndex]--;
  }

  for (int i = 0; i < n; i++) {
    arr[i] = output[i];
  }
}

void main() {
  List<String> strings = ["apple", "banana", "kiwi", "mango", "berry", "pear"];
  int maxLength = strings.reduce((a, b) => a.length > b.length ? a : b).length;

  print("Before sorting:");
  print(strings);

  radixSortStrings(strings, maxLength);

  print("After sorting:");
  print(strings);
}
