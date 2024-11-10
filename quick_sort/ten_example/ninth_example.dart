import 'dart:io';

void quickSort(List<int> arr, int low, int high, String pivotType) {
  if (low < high) {
    int pi = partition(arr, low, high, pivotType);

    quickSort(arr, low, pi - 1, pivotType);
    quickSort(arr, pi + 1, high, pivotType);
  }
}

int partition(List<int> arr, int low, int high, String pivotType) {
  int pivot = choosePivot(arr, low, high, pivotType);
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

int choosePivot(List<int> arr, int low, int high, String pivotType) {
  switch (pivotType) {
    case 'first':
      return arr[low];
    case 'last':
      return arr[high];
    case 'middle':
      return arr[(low + high) ~/ 2];
    default:
      return arr[high];
  }
}

void main() {
  List<int> numbers = [29, 10, 14, 37, 13, 25, 8];
  print("Choose pivot strategy (first, last, middle):");
  String? strategy = stdin.readLineSync();

  quickSort(numbers, 0, numbers.length - 1, strategy ?? 'last');

  print("Sorted list: $numbers");
}
