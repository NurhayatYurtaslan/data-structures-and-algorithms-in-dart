void quickSort(List<String> arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);

    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int partition(List<String> arr, int low, int high) {
  String pivot = arr[high].trim();
  int i = (low - 1);

  for (int j = low; j < high; j++) {
    if (arr[j].trim().compareTo(pivot) <= 0) {
      i++;
      String temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  String temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

void main() {
  List<String> words = ["  apple", "banana", "  cherry", "date  "];
  print("Before sorting: $words");

  quickSort(words, 0, words.length - 1);

  print("After sorting: $words");
}
