class TreeNode {
  int value;
  List<TreeNode> children;

  TreeNode(this.value) : children = [];
}

class Tree {
  TreeNode? root;

  int findMaxDepth(TreeNode? node) {
    if (node == null) return 0;

    int maxDepth = 0;
    for (TreeNode child in node.children) {
      int childDepth = findMaxDepth(child);
      if (childDepth > maxDepth) {
        maxDepth = childDepth;
      }
    }
    return maxDepth + 1;
  }
}

void main() {
  Tree tree = Tree();
  tree.root = TreeNode(1);
  tree.root!.children.add(TreeNode(2));
  tree.root!.children.add(TreeNode(3));
  tree.root!.children[0].children.add(TreeNode(4));
  tree.root!.children[0].children.add(TreeNode(5));
  tree.root!.children[0].children[0].children.add(TreeNode(6));

  int maxDepth = tree.findMaxDepth(tree.root);
  print("Maximum depth of the tree: $maxDepth");
}
