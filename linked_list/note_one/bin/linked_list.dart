class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}