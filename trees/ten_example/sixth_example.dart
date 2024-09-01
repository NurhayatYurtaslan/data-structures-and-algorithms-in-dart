class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;

  int countNodesAtLevel(TreeNode? node, int level) {
    if (node == null) return 0;
    if (level == 0) return 1;

    return countNodesAtLevel(node.left, level - 1) + countNodesAtLevel(node.right, level - 1);
  }
}

void main() {
  BinaryTree tree = BinaryTree();
  tree.root = TreeNode(1);
  tree.root!.left = TreeNode(2);
  tree.root!.right = TreeNode(3);
  tree.root!.left!.left = TreeNode(4);
  tree.root!.left!.right = TreeNode(5);
  tree.root!.right!.right = TreeNode(6);

  int level = 2;
  int count = tree.countNodesAtLevel(tree.root, level);
  print("Number of nodes at level $level: $count");
}
