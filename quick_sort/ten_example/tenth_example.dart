void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int pi = medianOfThreePartition(arr, low, high);

    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int medianOfThreePartition(List<int> arr, int low, int high) {
  int mid = (low + high) ~/ 2;
  int pivot = medianOfThree(arr, low, mid, high);

  arr[high] = pivot;
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

int medianOfThree(List<int> arr, int a, int b, int c) {
  if ((arr[a] - arr[b]) * (arr[c] - arr[a]) >= 0) return arr[a];
  if ((arr[b] - arr[a]) * (arr[c] - arr[b]) >= 0) return arr[b];
  return arr[c];
}

void main() {
  List<int> numbers = [40, 20, 50, 30, 10, 70, 60];
  print("Before sorting: $numbers");

  quickSort(numbers, 0, numbers.length - 1);

  print("After sorting: $numbers");
}
