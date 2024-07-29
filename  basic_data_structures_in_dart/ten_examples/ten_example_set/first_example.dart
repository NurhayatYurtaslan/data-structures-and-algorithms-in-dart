void main() {
  // Create a set of guest names
  Set<String> guestList = {'Alice', 'Bob', 'Charlie'};

  // Try to add duplicate names
  guestList.add('Alice'); // Will not be added, already exists
  guestList.add('David'); // Will be added

  // Print the guest list
  print('Guest List:');
  for (var guest in guestList) {
    print('- $guest');
  }
}
