void quickSort(List<int> arr, int low, int high, int depthLimit) {
  if (low < high && depthLimit > 0) {
    int pi = partition(arr, low, high);

    quickSort(arr, low, pi - 1, depthLimit - 1);
    quickSort(arr, pi + 1, high, depthLimit - 1);
  }
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
  int i = (low - 1);

  for (int j = low; j < high; j++) {
    if (arr[j] <= pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

void main() {
  List<int> numbers = [15, 3, 12, 6, -2, 10, 5];
  print("Before sorting: $numbers");

  quickSort(numbers, 0, numbers.length - 1, 3);

  print("After sorting: $numbers");
}
