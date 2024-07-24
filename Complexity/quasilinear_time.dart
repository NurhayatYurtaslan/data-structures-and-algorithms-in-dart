void merge(List<int> list, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;

  List<int> leftList = List<int>.generate(n1, (i) => list[left + i]);
  List<int> rightList = List<int>.generate(n2, (i) => list[mid + 1 + i]);

  int i = 0, j = 0, k = left;
  while (i < n1 && j < n2) {
    if (leftList[i] <= rightList[j]) {
      list[k++] = leftList[i++];
    } else {
      list[k++] = rightList[j++];
    }
  }

  while (i < n1) {
    list[k++] = leftList[i++];
  }

  while (j < n2) {
    list[k++] = rightList[j++];
  }
}

void mergeSort(List<int> list, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;

    mergeSort(list, left, mid);
    mergeSort(list, mid + 1, right);

    merge(list, left, mid, right);
  }
}

void main() {
  List<int> numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];

  print('Original list: $numbers');

  Stopwatch stopwatch = Stopwatch()..start();
  mergeSort(numbers, 0, numbers.length - 1);
  stopwatch.stop();

  print('Sorted list: $numbers');
  print('Execution time: ${stopwatch.elapsedMicroseconds} microseconds');
}
