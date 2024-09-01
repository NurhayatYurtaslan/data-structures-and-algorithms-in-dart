class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  bool isMirror(Node? node1, Node? node2) {
    if (node1 == null && node2 == null) return true;
    if (node1 == null || node2 == null) return false;

    return (node1.value == node2.value) &&
        isMirror(node1.left, node2.right) &&
        isMirror(node1.right, node2.left);
  }

  bool isSymmetric() {
    return isMirror(root, root);
  }
}

void main() {
  BinaryTree tree = BinaryTree();
  tree.root = Node(1);
  tree.root!.left = Node(2);
  tree.root!.right = Node(2);
  tree.root!.left!.left = Node(3);
  tree.root!.left!.right = Node(4);
  tree.root!.right!.left = Node(4);
  tree.root!.right!.right = Node(3);

  bool symmetric = tree.isSymmetric();
  print("Is the tree symmetric? $symmetric");
}
