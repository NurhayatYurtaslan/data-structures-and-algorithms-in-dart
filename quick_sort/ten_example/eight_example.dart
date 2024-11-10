import 'dart:async';
import 'dart:math';
import 'dart:isolate';

void quickSort(List<int> arr, int low, int high) async {
  if (low < high) {
    int pi = partition(arr, low, high);
    await Future.wait([
      Isolate.spawn((_) => quickSort(arr, low, pi - 1), null),
      Isolate.spawn((_) => quickSort(arr, pi + 1, high), null)
    ]);
  }
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
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

void main() async {
  List<int> numbers = List.generate(100000, (_) => Random().nextInt(100000));
  print("Before sorting: (first 10 elements) ${numbers.sublist(0, 10)}");

  await quickSort(numbers, 0, numbers.length - 1);

  print("After sorting: (first 10 elements) ${numbers.sublist(0, 10)}");
}
