void main() {
  // Create a linked list
  LinkedList list = LinkedList();

  // Add elements to the linked list
  list.add(10);
  list.add(20);
  list.add(30);
  list.add(40);

  // Print the original linked list
  print('Original Linked List:');
  list.printList();

  // Reverse the linked list
  list.reverse();

  // Print the reversed linked list
  print('Reversed Linked List:');
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

  // Method to reverse the linked list
  void reverse() {
    Node? prev = null;
    Node? current = head;
    Node? next = null;

    while (current != null) {
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
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
