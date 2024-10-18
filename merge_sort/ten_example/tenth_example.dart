void mergeDescending(List<int> arr, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;

  List<int> leftArray = List.generate(n1, (index) => arr[left + index]);
  List<int> rightArray = List.generate(n2, (index) => arr[mid + 1 + index]);

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

void mergeSortDescending(List<int> arr, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;

    mergeSortDescending(arr, left, mid);
    mergeSortDescending(arr, mid + 1, right);

    mergeDescending(arr, left, mid, right);
  }
}

void main() {
  List<int> numbers = [8, 3, 7, 2, 6, 4, 5, 1];

  print("Original array:");
  print(numbers);

  mergeSortDescending(numbers, 0, numbers.length - 1);

  print("\nSorted in descending order:");
  print(numbers);
}
