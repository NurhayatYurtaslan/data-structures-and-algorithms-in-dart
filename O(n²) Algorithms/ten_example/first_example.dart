void selectionSort(List<int> arr) {
  int n = arr.length;

  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    int temp = arr[minIndex];
    arr[minIndex] = arr[i];
    arr[i] = temp;
  }
}

void main() {
  List<int> arr = [64, 25, 12, 22, 11];
  selectionSort(arr);
  print('Sorted array: $arr'); // Output: [11, 12, 22, 25, 64]
}
