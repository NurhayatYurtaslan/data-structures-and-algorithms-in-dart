void heapSort(List<int> arr, {bool descending = false}) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i, descending);
  }

  for (int i = n - 1; i > 0; i--) {
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    heapify(arr, i, 0, descending);
  }
}

void heapify(List<int> arr, int n, int i, bool descending) {
  int extreme = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && (descending ? arr[left] < arr[extreme] : arr[left] > arr[extreme])) {
    extreme = left;
  }

  if (right < n && (descending ? arr[right] < arr[extreme] : arr[right] > arr[extreme])) {
    extreme = right;
  }

  if (extreme != i) {
    int swap = arr[i];
    arr[i] = arr[extreme];
    arr[extreme] = swap;

    heapify(arr, n, extreme, descending);
  }
}

void main() {
  List<int> numbers = [10, 20, 15, 30, 40];
  
  print("Before sorting:");
  print(numbers);

  heapSort(numbers);
  print("After sorting (Ascending):");
  print(numbers);

  heapSort(numbers, descending: true);
  print("After sorting (Descending):");
  print(numbers);
}
