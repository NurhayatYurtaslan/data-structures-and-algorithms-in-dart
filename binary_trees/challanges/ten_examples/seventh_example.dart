import 'dart:collection';

class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  void levelOrderTraversal(Node? node) {
    if (node == null) return;

    Queue<Node> queue = Queue<Node>();
    queue.add(node);

    while (queue.isNotEmpty) {
      Node current = queue.removeFirst();
      print(current.value);

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
  }
}

void main() {
  // Binary tree oluşturma
  BinaryTree tree = BinaryTree();
  tree.root = Node(1);
  tree.root!.left = Node(2);
  tree.root!.right = Node(3);
  tree.root!.left!.left = Node(4);
  tree.root!.left!.right = Node(5);

  // Düzey düzey dolaşım
  print("Level Order Traversal:");
  tree.levelOrderTraversal(tree.root);
}
