class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  int countLeafNodes(Node? node) {
    if (node == null) return 0;

    if (node.left == null && node.right == null) {
      return 1;
    }

    return countLeafNodes(node.left) + countLeafNodes(node.right);
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

  // Yaprak düğüm sayısını hesaplama
  int leafCount = tree.countLeafNodes(tree.root);
  print("Total leaf nodes in the tree: $leafCount");
}
