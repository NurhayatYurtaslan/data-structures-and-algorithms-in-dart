void main() {
  // Two maps representing inventory in different warehouses
  Map<String, int> warehouse1 = {
    'Apples': 50,
    'Bananas': 30,
    'Oranges': 20,
  };

  Map<String, int> warehouse2 = {
    'Bananas': 20,
    'Oranges': 40,
    'Pineapples': 10,
  };

  // Map to store merged inventory
  Map<String, int> mergedInventory = {};

  // Merge the two inventories
  for (var entry in warehouse1.entries) {
    mergedInventory[entry.key] = entry.value;
  }

  for (var entry in warehouse2.entries) {
    if (mergedInventory.containsKey(entry.key)) {
      mergedInventory[entry.key] = mergedInventory[entry.key]! + entry.value;
    } else {
      mergedInventory[entry.key] = entry.value;
    }
  }

  // Print the merged inventory
  print('Merged Inventory:');
  mergedInventory.forEach((item, quantity) {
    print('$item: $quantity');
  });
}
