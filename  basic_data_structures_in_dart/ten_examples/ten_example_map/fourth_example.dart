void main() {
  // List of products with categories
  List<Map<String, String>> products = [
    {'name': 'Apple', 'category': 'Fruits'},
    {'name': 'Banana', 'category': 'Fruits'},
    {'name': 'Carrot', 'category': 'Vegetables'},
    {'name': 'Broccoli', 'category': 'Vegetables'},
    {'name': 'Milk', 'category': 'Dairy'},
    {'name': 'Cheese', 'category': 'Dairy'},
  ];

  // Map to group products by category
  Map<String, List<String>> categoryMap = {};

  // Group products by category
  for (var product in products) {
    String category = product['category']!;
    String name = product['name']!;

    if (!categoryMap.containsKey(category)) {
      categoryMap[category] = [];
    }
    categoryMap[category]!.add(name);
  }

  // Print the grouped products
  print('Products grouped by category:');
  categoryMap.forEach((category, items) {
    print('$category: $items');
  });
}
