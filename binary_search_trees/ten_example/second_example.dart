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

  bool search(int value) {
    return _search(root, value);
  }

  bool _search(TreeNode? node, int value) {
    if (node == null) return false;

    if (value == node.value) return true;

    if (value < node.value) {
      return _search(node.left, value);
    } else {
      return _search(node.right, value);
    }
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);

  print("Is 40 in the BST? ${bst.search(40)}"); // Output: true
  print("Is 25 in the BST? ${bst.search(25)}"); // Output: false
}
