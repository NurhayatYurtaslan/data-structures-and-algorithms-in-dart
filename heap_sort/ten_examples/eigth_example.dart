void heapSortWithComparator<T>(List<T> arr, int Function(T, T) comparator) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i, comparator);
  }

  for (int i = n - 1; i > 0; i--) {
    T temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    heapify(arr, i, 0, comparator);
  }
}

void heapify<T>(List<T> arr, int n, int i, int Function(T, T) comparator) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && comparator(arr[left], arr[largest]) > 0) {
    largest = left;
  }

  if (right < n && comparator(arr[right], arr[largest]) > 0) {
    largest = right;
  }

  if (largest != i) {
    T swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    heapify(arr, n, largest, comparator);
  }
}

void main() {
  List<int> numbers = [5, 3, 8, 1, 2];

  print("Before sorting:");
  print(numbers);

  heapSortWithComparator(numbers, (a, b) => a.compareTo(b));
  print("After sorting (Ascending):");
  print(numbers);

  heapSortWithComparator(numbers, (a, b) => b.compareTo(a));
  print("After sorting (Descending):");
  print(numbers);
}
