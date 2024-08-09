void main() {
  // Create a multilevel doubly linked list
  DoublyNode head = DoublyNode(1);
  head.next = DoublyNode(2);
  head.next!.next = DoublyNode(3);
  head.next!.next!.next = DoublyNode(4);

  head.next!.down = DoublyNode(5);
  head.next!.down!.next = DoublyNode(6);
  head.next!.down!.next!.down = DoublyNode(7);

  head.next!.next!.down = DoublyNode(8);
  head.next!.next!.down!.next = DoublyNode(9);

  // Flatten the multilevel list
  DoublyNode flattenedHead = flatten(head);

  // Print the flattened list
  print('Flattened Linked List:');
  printList(flattenedHead);
}

// DoublyNode class to represent each element in the doubly linked list
class DoublyNode {
  int value;
  DoublyNode? next;
  DoublyNode? down;

  DoublyNode(this.value);
}

// Method to flatten a multilevel doubly linked list
DoublyNode flatten(DoublyNode head) {
  DoublyNode dummy = DoublyNode(0);
  DoublyNode current = dummy;
  DoublyNode? stack = head;

  while (stack != null) {
    current.next = stack;
    stack!.next = null;
    current = current.next!;

    if (stack.down != null) {
      DoublyNode? temp = stack.next;
      stack = stack.down;
      stack.next = temp;
    } else {
      stack = stack.next;
    }
  }

  return dummy.next!;
}

// Method to print the doubly linked list
void printList(DoublyNode? head) {
  DoublyNode? current = head;
  while (current != null) {
    print(current.value);
    current = current.next;
  }
}
