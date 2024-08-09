void main() {
  // Create a linked list with a loop
  LinkedList list = LinkedList();

  list.add(10);
  list.add(20);
  list.add(30);
  list.add(40);
  list.add(50);

  // Create a loop for testing
  list.createLoop(30);

  // Remove the loop from the linked list
  list.removeLoop();

  // Print the linked list
  print('Linked List after removing the loop:');
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

  // Method to remove a loop from the linked list
  void removeLoop() {
    Node? slow = head;
    Node? fast = head;
    Node? loopNode = null;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;

      if (slow == fast) {
        loopNode = slow;
        break;
      }
    }

    if (loopNode != null) {
      Node? start = head;
      while (start != loopNode) {
        start = start!.next;
        loopNode = loopNode!.next;
      }

      while (loopNode!.next != start) {
        loopNode = loopNode.next;
      }
      loopNode.next = null;
    }
  }

  // Method to print the linked list
  void printList() {
    Node? current = head;
    Set<Node> visited = {};
    while (current != null) {
      if (visited.contains(current)) {
        print('Loop detected, ending print.');
        break;
      }
      print(current.value);
      visited.add(current);
      current = current.next;
    }
  }
}
