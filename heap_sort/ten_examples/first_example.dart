void heapSort(List<int> arr) {
  int n = arr.length;

  // Maksimum yığın oluşturma
  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }

  // Elemanları birer birer yığından çıkarma
  for (int i = n - 1; i > 0; i--) {
    // Kökü son elemana taşıma
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    // Azalan yığında tekrar heapify
    heapify(arr, i, 0);
  }
}

void heapify(List<int> arr, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  // Sol çocuğun kökten büyük olup olmadığını kontrol et
  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  // Sağ çocuğun kökten büyük olup olmadığını kontrol et
  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  // Eğer kök, en büyük değilse
  if (largest != i) {
    int swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    // Etkilenen alt ağacı tekrar heapify et
    heapify(arr, n, largest);
  }
}

void main() {
  List<int> numbers = [12, 11, 13, 5, 6, 7];
  print("Before sorting:");
  print(numbers);

  heapSort(numbers);

  print("After sorting:");
  print(numbers);
}
