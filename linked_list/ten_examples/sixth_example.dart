void main() {
  // Create a linked list
  LinkedList list = LinkedList();

  // Add elements to the linked list
  list.add(10);
  list.add(20);
  list.add(30);
  list.add(40);

  // Create a loop for testing
  list.createLoop(30);

  // Check for a loop in the linked list
  print('Does the linked list have a loop? ${list.hasLoop()}');
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

  // Method to create a loop in the linked list for testing
  void createLoop(int value) {
    Node? loopNode;
    Node? lastNode = head;

    while (lastNode?.next != null) {
      if (lastNode?.value == value) {
        loopNode = lastNode;
      }
      lastNode = lastNode!.next;
    }
    if (loopNode != null) {
      lastNode?.next = loopNode;
    }
  }

  // Method to detect a loop in the linked list
  bool hasLoop() {
    Node? slow = head;
    Node? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;

      if (slow == fast) {
        return true;
      }
    }
    return false;
  }
}
