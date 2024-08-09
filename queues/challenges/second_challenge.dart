class Node {
  dynamic data;
  Node? next;

  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear;

  void enqueue(dynamic item) {
    Node newNode = Node(item);
    if (rear == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  dynamic dequeue() {
    if (front == null) {
      return null;
    }
    dynamic dequeued = front!.data;
    front = front!.next;
    if (front == null) {
      rear = null;
    }
    return dequeued;
  }

  bool get isEmpty => front == null;

  @override
  String toString() {
    if (isEmpty) {
      return "";
    }
    List<String> nodes = [];
    Node? current = front;
    while (current != null) {
      nodes.add(current.data.toString());
      current = current.next;
    }
    return nodes.join("-");
  }
}

void main() {
  Queue queue = Queue();
  queue.enqueue("S");
  queue.enqueue("P");
  queue.enqueue("E");
  queue.enqueue("E");
  queue.enqueue("D");
  print("Initial Queue: $queue");

  queue.enqueue("D");
  print("After enqueue('D'): $queue");

  queue.enqueue("A");
  print("After enqueue('A'): $queue");

  queue.dequeue();
  print("After dequeue(): $queue");

  queue.enqueue("R");
  print("After enqueue('R'): $queue");

  queue.dequeue();
  print("After dequeue(): $queue");

  queue.dequeue();
  print("After dequeue(): $queue");

  queue.enqueue("T");
  print("After enqueue('T'): $queue");
}
