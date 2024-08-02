import 'linked_list.dart';

void main() {
  final node1 = Node<int>(1, value: 1);
  final node2 = Node<int>(2, value: 2);
  final node3 = Node<int>(3, value: 3);

  node1.next = node2;
  node2.next = node3;

  print(node1); // Output: 1 -> 2 -> 3
}
