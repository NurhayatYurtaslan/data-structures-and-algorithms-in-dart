class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  int countNodes(Node? node) {
    if (node == null) return 0;

    return 1 + countNodes(node.left) + countNodes(node.right);
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

  // Düğüm sayısını hesaplama
  int count = tree.countNodes(tree.root);
  print("Total nodes in the tree: $count");
}
