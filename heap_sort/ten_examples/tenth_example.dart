void heapSort(List<String> arr, {bool caseSensitive = true}) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i, caseSensitive);
  }

  for (int i = n - 1; i > 0; i--) {
    String temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    heapify(arr, i, 0, caseSensitive);
  }
}

void heapify(List<String> arr, int n, int i, bool caseSensitive) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  String compareStr(String s1, String s2) {
    return caseSensitive ? s1 : s1.toLowerCase();
  }

  if (left < n && compareStr(arr[left], arr[largest]).compareTo(compareStr(arr[largest], arr[largest])) > 0) {
    largest = left;
  }

  if (right < n && compareStr(arr[right], arr[largest]).compareTo(compareStr(arr[largest], arr[largest])) > 0) {
    largest = right;
  }

  if (largest != i) {
    String swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    heapify(arr, n, largest, caseSensitive);
  }
}

void main() {
  List<String> words = ["apple", "Banana", "cherry", "Apple", "banana"];
  print("Before sorting:");
  print(words);

  // Büyük/küçük harf duyarlı sıralama
  heapSort(words, caseSensitive: false);

  print("\nAfter sorting (case-insensitive):");
  print(words);
}
