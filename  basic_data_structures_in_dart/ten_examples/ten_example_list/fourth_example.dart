void main() {
  // List of products with name and price
  List<Product> products = [
    Product('Laptop', 1200.00),
    Product('Smartphone', 800.00),
    Product('Tablet', 300.00),
    Product('Headphones', 150.00),
    Product('Smartwatch', 250.00),
  ];
  
  products.sort((a,b)=> a.price.compareTo(b.price));
  
  double minPrice=0;
  double midPrice=500;
  double maxPrice=1000;
  
  List<Product> minProducts = filterProductsMin(products,minPrice,midPrice);
  print("Min Price Product");
  for (var product in minProducts){
    print('-${product.name}: \$${product.price}');
  }
  
  List<Product> midProducts = filterProductsMid(products,midPrice,maxPrice);
  print("Mid Price Product");
  for (var product in midProducts){
    print('-${product.name}: \$${product.price}');
  }
  
  List<Product> maxProducts = filterProductsMax(products,maxPrice);
  print("Max Price Product");
  for (var product in maxProducts){
    print('-${product.name}: \$${product.price}');
  }
}

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

List<Product> filterProductsMin(List<Product> products, double minPrice, double midPrice) {
  return products.where((product) => product.price >= minPrice && product.price < midPrice).toList();
}

List<Product> filterProductsMid(List<Product> products, double midPrice, double maxPrice) {
  return products.where((product) => product.price >= midPrice && product.price < maxPrice).toList();
}

List<Product> filterProductsMax(List<Product> products, double maxPrice) {
  return products.where((product) => product.price >= maxPrice).toList();
}
