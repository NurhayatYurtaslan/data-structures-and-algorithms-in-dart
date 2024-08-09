void main() {
  // Create two sorted linked lists
  LinkedList list1 = LinkedList();
  LinkedList list2 = LinkedList();

  list1.add(1);
  list1.add(3);
  list1.add(5);

  list2.add(2);
  list2.add(4);
  list2.add(6);

  // Merge the two linked lists
  LinkedList mergedList = mergeLists(list1, list2);

  // Print the merged linked list
  print('Merged Linked List:');
  mergedList.printList();
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

  // Method to print the linked list
  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

// Method to merge two sorted linked lists
LinkedList mergeLists(LinkedList list1, LinkedList list2) {
  LinkedList mergedList = LinkedList();
  Node? current1 = list1.head;
  Node? current2 = list2.head;

  while (current1 != null && current2 != null) {
    if (current1.value <= current2.value) {
      mergedList.add(current1.value);
      current1 = current1.next;
    } else {
      mergedList.add(current2.value);
      current2 = current2.next;
    }
  }

  while (current1 != null) {
    mergedList.add(current1.value);
    current1 = current1.next;
  }

  while (current2 != null) {
    mergedList.add(current2.value);
    current2 = current2.next;
  }

  return mergedList;
}
