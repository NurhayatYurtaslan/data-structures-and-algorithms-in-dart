void main() {
  // Create a linked list
  LinkedList list = LinkedList();

  // Add elements to the linked list
  list.add(10);
  list.add(20);
  list.add(30);
  list.add(40);
  list.add(50);

  // Find and print the middle node
  print('Middle Node: ${list.findMiddle()}');
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

  // Method to find the middle node
  int? findMiddle() {
    if (head == null) return null;

    Node? slow = head;
    Node? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    return slow?.value;
  }
}
