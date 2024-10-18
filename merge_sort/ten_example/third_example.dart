void mergeChar(List<String> arr, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;

  List<String> leftArray = List.filled(n1, '');
  List<String> rightArray = List.filled(n2, '');

  for (int i = 0; i < n1; i++) {
    leftArray[i] = arr[left + i];
  }
  for (int j = 0; j < n2; j++) {
    rightArray[j] = arr[mid + 1 + j];
  }

  int i = 0, j = 0, k = left;

  while (i < n1 && j < n2) {
    if (leftArray[i].compareTo(rightArray[j]) <= 0) {
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

void mergeSortChar(List<String> arr, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;

    mergeSortChar(arr, left, mid);
    mergeSortChar(arr, mid + 1, right);

    mergeChar(arr, left, mid, right);
  }
}

void main() {
  List<String> arr = ['d', 'a', 'e', 'c', 'b'];
  print("Original list: $arr");

  mergeSortChar(arr, 0, arr.length - 1);
  print("Sorted list: $arr");
}
