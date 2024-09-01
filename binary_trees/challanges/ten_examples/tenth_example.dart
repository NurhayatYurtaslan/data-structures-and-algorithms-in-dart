class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  int diameter(Node? node) {
    if (node == null) return 0;

    int leftHeight = height(node.left);
    int rightHeight = height(node.right);

    int leftDiameter = diameter(node.left);
    int rightDiameter = diameter(node.right);

    return max(leftHeight + rightHeight + 1, max(leftDiameter, rightDiameter));
  }

  int height(Node? node) {
    if (node == null) return 0;

    return 1 + max(height(node.left), height(node.right));
  }

  int max(int a, int b) => (a > b) ? a : b;
}

void main() {
  BinaryTree tree = BinaryTree();
  tree.root = Node(1);
  tree.root!.left = Node(2);
  tree.root!.right = Node(3);
  tree.root!.left!.left = Node(4);
  tree.root!.left!.right = Node(5);
  tree.root!.left!.right!.left = Node(6);

  int diameter = tree.diameter(tree.root);
  print("Diameter of the tree: $diameter");
}
