class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  void preorderTraversal(Node? node) {
    if (node == null) return;

    print(node.value);
    preorderTraversal(node.left);
    preorderTraversal(node.right);
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

  // Preorder dolaşım
  print("Preorder traversal:");
  tree.preorderTraversal(tree.root);
}
