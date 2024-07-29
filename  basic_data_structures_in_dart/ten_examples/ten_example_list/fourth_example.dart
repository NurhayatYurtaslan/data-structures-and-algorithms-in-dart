void main() {
  // List of products with name and price
  List<Product> products = [
    Product('Laptop', 1200.00),
    Product('Smartphone', 800.00),
    Product('Tablet', 300.00),
    Product('Headphones', 150.00),
    Product('Smartwatch', 250.00),
  ];

  // Sort products by price
  products.sort((a, b) => a.price.compareTo(b.price));

  // Filter products under a specific price
  double maxPrice = 500.00;
  List<Product> affordableProducts = filterAffordableProducts(products, maxPrice);

  // Print the sorted and filtered list
  print('Affordable Products under \$$maxPrice:');
  for (var product in affordableProducts) {
    print('- ${product.name}: \$${product.price}');
  }
}

// Product class to hold product details
class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

// Method to filter products under a specific price
List<Product> filterAffordableProducts(List<Product> products, double maxPrice) {
  return products.where((product) => product.price < maxPrice).toList();
}
