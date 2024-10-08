void bubbleSort(List<int> arr) {
  int n = arr.length;
  
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> arr = [5, 3, 8, 4, 2];
  bubbleSort(arr);
  print('Sorted array: $arr'); // Output: [2, 3, 4, 5, 8]
}
