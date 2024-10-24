void merge(List<int> arr, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;

  List<int> leftArray = List.filled(n1, 0);
  List<int> rightArray = List.filled(n2, 0);

  for (int i = 0; i < n1; i++) {
    leftArray[i] = arr[left + i];
  }
  for (int j = 0; j < n2; j++) {
    rightArray[j] = arr[mid + 1 + j];
  }

  int i = 0, j = 0, k = left;

  while (i < n1 && j < n2) {
    if (leftArray[i] <= rightArray[j]) {
      arr[k] = leftArray[i];
      i++;
    } else {
      arr[k] = rightArray[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = leftArray[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = rightArray[j];
    j++;
    k++;
  }
}

void mergeSort(List<int> arr, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;

    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);

    merge(arr, left, mid, right);
  }
}

void main() {
  List<List<int>> matrix = [
    [9, 3, 5],
    [4, 2, 8],
    [7, 6, 1]
  ];

  print("Original matrix:");
  matrix.forEach((row) => print(row));

  for (int i = 0; i < matrix.length; i++) {
    mergeSort(matrix[i], 0, matrix[i].length - 1);
  }

  print("\nSorted matrix:");
  matrix.forEach((row) => print(row));
}
