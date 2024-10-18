void merge(List<List<int>> arr, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;

  List<List<int>> leftArray = List.generate(n1, (index) => []);
  List<List<int>> rightArray = List.generate(n2, (index) => []);

  for (int i = 0; i < n1; i++) {
    leftArray[i] = arr[left + i];
  }
  for (int j = 0; j < n2; j++) {
    rightArray[j] = arr[mid + 1 + j];
  }

  int i = 0, j = 0, k = left;

  while (i < n1 && j < n2) {
    if (leftArray[i][0] <= rightArray[j][0]) {
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

void mergeSort(List<List<int>> arr, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;

    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);

    merge(arr, left, mid, right);
  }
}

void main() {
  List<int> numbers = [4, 2, 2, 3, 1, 4, 5, 3, 1];
  
  // Yinelenen sayıları grupla
  Map<int, List<int>> groupedNumbers = {};
  for (int number in numbers) {
    if (!groupedNumbers.containsKey(number)) {
      groupedNumbers[number] = [];
    }
    groupedNumbers[number]!.add(number);
  }

  // Grupları liste olarak dönüştür
  List<List<int>> groupedList = groupedNumbers.values.toList();

  print("Original grouped list:");
  groupedList.forEach((group) => print(group));

  // Grupları sıralamak için merge sort kullan
  mergeSort(groupedList, 0, groupedList.length - 1);

  print("\nSorted grouped list:");
  groupedList.forEach((group) => print(group));
}
