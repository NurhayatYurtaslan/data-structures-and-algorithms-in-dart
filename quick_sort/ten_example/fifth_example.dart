void quickSort(List<num> arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);

    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int partition(List<num> arr, int low, int high) {
  num pivot = arr[high];
  int i = (low - 1);

  for (int j = low; j < high; j++) {
    if (arr[j] <= pivot) {
      i++;
      num temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  num temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

void main() {
  List<num> mixedNumbers = [2, 3.5, 1.2, 4, 0.5, 7, 3.1];
  print("Before sorting: $mixedNumbers");

  quickSort(mixedNumbers, 0, mixedNumbers.length - 1);

  print("After sorting: $mixedNumbers");
}
