class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;

  TreeNode? findLCA(TreeNode? node, int n1, int n2) {
    if (node == null) return null;

    if (node.value == n1 || node.value == n2) return node;

    TreeNode? leftLCA = findLCA(node.left, n1, n2);
    TreeNode? rightLCA = findLCA(node.right, n1, n2);

    if (leftLCA != null && rightLCA != null) return node;

    return leftLCA ?? rightLCA;
  }
}

void main() {
  BinaryTree tree = BinaryTree();
  tree.root = TreeNode(3);
  tree.root!.left = TreeNode(5);
  tree.root!.right = TreeNode(1);
  tree.root!.left!.left = TreeNode(6);
  tree.root!.left!.right = TreeNode(2);
  tree.root!.right!.left = TreeNode(0);
  tree.root!.right!.right = TreeNode(8);
  tree.root!.left!.right!.left = TreeNode(7);
  tree.root!.left!.right!.right = TreeNode(4);

  TreeNode? lca = tree.findLCA(tree.root, 5, 1);
  if (lca != null) {
    print("LCA of 5 and 1 is ${lca.value}");
  } else {
    print("LCA not found.");
  }
}
