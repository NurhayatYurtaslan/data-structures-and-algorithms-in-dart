void main() {
  // Create a linked list with duplicates
  LinkedList list = LinkedList();
  list.add(10);
  list.add(20);
  list.add(20);
  list.add(30);
  list.add(30);
  list.add(40);

  // Print the linked list before removing duplicates
  print('Linked List before removing duplicates:');
  list.printList();

  // Remove duplicates
  list.removeDuplicates();

  // Print the linked list after removing duplicates
  print('Linked List after removing duplicates:');
  list.printList();
}

// Node class to represent each element in the linked list
class Node {
  int value;
  Node? next;

  Node(this.value);
}

// LinkedList class to manage nodes
class LinkedList {
  Node? head;

  // Method to add an element to the linked list
  void add(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
  }

  // Method to remove duplicates from the linked list
  void removeDuplicates() {
    Set<int> seenValues = {};
    Node? current = head;
    Node? prev;

    while (current != null) {
      if (seenValues.contains(current.value)) {
        prev!.next = current.next;
      } else {
        seenValues.add(current.value);
        prev = current;
      }
      current = current.next;
    }
  }

  // Method to print the linked list
  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}
