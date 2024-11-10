void heapSortStringsByLength(List<String> arr) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapifyByLength(arr, n, i);
  }

  for (int i = n - 1; i > 0; i--) {
    String temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    heapifyByLength(arr, i, 0);
  }
}

void heapifyByLength(List<String> arr, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && arr[left].length > arr[largest].length) {
    largest = left;
  }

  if (right < n && arr[right].length > arr[largest].length) {
    largest = right;
  }

  if (largest != i) {
    String swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    heapifyByLength(arr, n, largest);
  }
}

void main() {
  List<String> words = ["apple", "banana", "kiwi", "mango"];
  print("Before sorting by length:");
  print(words);

  heapSortStringsByLength(words);

  print("After sorting by length:");
  print(words);
}
