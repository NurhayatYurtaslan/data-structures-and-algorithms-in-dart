import 'dart:math';

void heapSort(List<int> arr) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }

  for (int i = n - 1; i > 0; i--) {
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    heapify(arr, i, 0);
  }
}

void heapify(List<int> arr, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  if (largest != i) {
    int swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    heapify(arr, n, largest);
  }
}

void main() {
  List<int> largeList = List.generate(1000000, (index) => Random().nextInt(1000000));
  print("Sorting a very large list...");

  final stopwatch = Stopwatch()..start();
  heapSort(largeList);
  stopwatch.stop();

  print("Sorting completed in ${stopwatch.elapsedMilliseconds} ms.");
}
