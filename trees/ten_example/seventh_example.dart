class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;

  void leftView(TreeNode? node, int level, List<int> result) {
    if (node == null) return;

    if (level == result.length) {
      result.add(node.value);
    }

    leftView(node.left, level + 1, result);
    leftView(node.right, level + 1, result);
  }
}

void main() {
  BinaryTree tree = BinaryTree();
  tree.root = TreeNode(1);
  tree.root!.left = TreeNode(2);
  tree.root!.right = TreeNode(3);
  tree.root!.left!.left = TreeNode(4);
  tree.root!.left!.right = TreeNode(5);
  tree.root!.right!.left = TreeNode(6);
  tree.root!.right!.right = TreeNode(7);

  List<int> result = [];
  tree.leftView(tree.root, 0, result);

  print("Left view of the tree: $result");
}
