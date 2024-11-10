class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

void heapSort(List<Product> arr) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }

  for (int i = n - 1; i > 0; i--) {
    Product temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    heapify(arr, i, 0);
  }
}

void heapify(List<Product> arr, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && arr[left].price > arr[largest].price) {
    largest = left;
  }

  if (right < n && arr[right].price > arr[largest].price) {
    largest = right;
  }

  if (largest != i) {
    Product swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    heapify(arr, n, largest);
  }
}

void main() {
  List<Product> products = [
    Product("Laptop", 1200.0),
    Product("Phone", 800.0),
    Product("Tablet", 600.0),
    Product("Monitor", 300.0)
  ];

  print("Before sorting:");
  for (var product in products) {
    print("${product.name}: \$${product.price}");
  }

  heapSort(products);

  print("After sorting:");
  for (var product in products) {
    print("${product.name}: \$${product.price}");
  }
}
