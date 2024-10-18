void mergeDesc(List<int> arr, int left, int mid, int right) {
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
    if (leftArray[i] >= rightArray[j]) {
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

void mergeSortDesc(List<int> arr, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;

    mergeSortDesc(arr, left, mid);
    mergeSortDesc(arr, mid + 1, right);

    mergeDesc(arr, left, mid, right);
  }
}

void main() {
  List<int> arr = [4, 10, 2, 8, 6];
  print("Original array: $arr");

  mergeSortDesc(arr, 0, arr.length - 1);
  print("Array sorted in descending order: $arr");
}
