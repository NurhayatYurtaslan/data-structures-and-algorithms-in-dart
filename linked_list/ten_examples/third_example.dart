void main() {
  // Create a linked list
  LinkedList list = LinkedList();

  // Add elements to the linked list
  list.add(10);
  list.add(20);
  list.add(30);

  // Remove the first node
  list.removeFirst();

  // Print the linked list
  print('Linked List after removing the first node:');
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

  // Method to remove the first node
  void removeFirst() {
    if (head != null) {
      head = head!.next;
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
