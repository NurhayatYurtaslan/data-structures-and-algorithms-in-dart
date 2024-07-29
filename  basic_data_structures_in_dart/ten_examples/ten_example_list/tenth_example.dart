void main() {
  // Create a doubly linked list
  DoublyLinkedList linkedList = DoublyLinkedList();

  // Add nodes to the linked list
  linkedList.add(10);
  linkedList.add(20);
  linkedList.add(30);
  linkedList.add(40);

  // Traverse and print the linked list forward
  print('Doubly Linked List (Forward):');
  linkedList.traverseForward();

  // Traverse and print the linked list backward
  print('Doubly Linked List (Backward):');
  linkedList.traverseBackward();

  // Insert a node after a specific node
  linkedList.insertAfter(20, 25);
  print('Doubly Linked List after inserting 25 after 20 (Forward):');
  linkedList.traverseForward();

  // Remove a node
  linkedList.remove(30);
  print('Doubly Linked List after removal of 30 (Forward):');
  linkedList.traverseForward();
}

// Node class to represent each element in the doubly linked list
class Node {
  int value;
  Node? next;
  Node? prev;

  Node(this.value);
}

// DoublyLinkedList class to manage nodes
class DoublyLinkedList {
  Node? head;
  Node? tail;

  // Method to add a node to the end of the linked list
  void add(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  // Method to remove a node from the linked list
  void remove(int value) {
    Node? current = head;
    while (current != null) {
      if (current.value == value) {
        if (current.prev != null) {
          current.prev!.next = current.next;
        } else {
          head = current.next;
        }

        if (current.next != null) {
          current.next!.prev = current.prev;
        } else {
          tail = current.prev;
        }
        return;
      }
      current = current.next;
    }
  }

  // Method to traverse the linked list forward
  void traverseForward() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

  // Method to traverse the linked list backward
  void traverseBackward() {
    Node? current = tail;
    while (current != null) {
      print(current.value);
      current = current.prev;
    }
  }

  // Method to insert a node after a specific node
  void insertAfter(int targetValue, int newValue) {
    Node? current = head;
    while (current != null) {
      if (current.value == targetValue) {
        Node newNode = Node(newValue);
        newNode.next = current.next;
        newNode.prev = current;
        if (current.next != null) {
          current.next!.prev = newNode;
        }
        current.next = newNode;

        if (current == tail) {
          tail = newNode;
        }
        return;
      }
      current = current.next;
    }
  }
}
