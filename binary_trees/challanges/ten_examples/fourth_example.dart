class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  int height(Node? node) {
    if (node == null) return 0;

    int leftHeight = height(node.left);
    int rightHeight = height(node.right);

    return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight);
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

  // Ağacın yüksekliğini hesaplama
  int treeHeight = tree.height(tree.root);
  print("Height of the tree: $treeHeight");
}
