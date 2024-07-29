void main() {
  // Two lists of email addresses
  List<String> list1 = ['alice@example.com', 'bob@example.com', 'charlie@example.com'];
  List<String> list2 = ['bob@example.com', 'david@example.com', 'emily@example.com'];

  // Merge and remove duplicates
  List<String> mergedList = mergeAndRemoveDuplicates(list1, list2);

  // Print the merged list
  print('Merged Email List:');
  for (var email in mergedList) {
    print('- $email');
  }
}

// Method to merge two lists and remove duplicates
List<String> mergeAndRemoveDuplicates(List<String> list1, List<String> list2) {
  // Merge lists and convert to a set to remove duplicates
  return {...list1, ...list2}.toList();
}
