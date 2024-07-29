void main() {
  // Create a grocery list
  List<String> groceryList = ['Bread', 'Milk', 'Eggs', 'Cheese'];

  // Add a new item to the grocery list
  addItem(groceryList, 'Butter');

  // Print the grocery list
  print('Grocery List:');
  for (var item in groceryList) {
    print('- $item');
  }
}

// Method to add an item to the grocery list
void addItem(List<String> list, String item) {
  list.add(item);
}
