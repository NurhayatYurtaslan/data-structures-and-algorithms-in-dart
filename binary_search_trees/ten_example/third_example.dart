class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinarySearchTree {
  TreeNode? root;

  void insert(int value) {
    root = _insert(root, value);
  }

  TreeNode? _insert(TreeNode? node, int value) {
    if (node == null) return TreeNode(value);

    if (value < node.value) {
      node.left = _insert(node.left, value);
    } else if (value > node.value) {
      node.right = _insert(node.right, value);
    }

    return node;
  }

  int findMin() {
    if (root == null) throw Exception("Tree is empty");
    return _findMin(root!).value;
  }

  TreeNode _findMin(TreeNode node) {
    while (node.left != null) {
      node = node.left!;
    }
    return node;
  }

  int findMax() {
    if (root == null) throw Exception("Tree is empty");
    return _findMax(root!).value;
  }

  TreeNode _findMax(TreeNode node) {
    while (node.right != null) {
      node = node.right!;
    }
    return node;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);

  print("Minimum value in the BST: ${bst.findMin()}"); // Output: 20
  print("Maximum value in the BST: ${bst.findMax()}"); // Output: 70
}
