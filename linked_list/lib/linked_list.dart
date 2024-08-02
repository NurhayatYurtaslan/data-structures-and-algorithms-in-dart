class Node<T> {
  Node(value1, {required this.value, this.next});
  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) {
      return '$value';
    } else {
      return '$value -> ${next.toString()}';
    }
  }
}
