class TreeNode {
  int value;
  List<TreeNode> children;

  TreeNode(this.value) : children = [];
}

class Tree {
  TreeNode? root;

  bool findPath(TreeNode? node, List<int> path, int target) {
    if (node == null) return false;

    path.add(node.value);

    if (node.value == target) return true;

    for (TreeNode child in node.children) {
      if (findPath(child, path, target)) return true;
    }

    path.removeLast();
    return false;
  }
}

void main() {
  Tree tree = Tree();
  tree.root = TreeNode(1);
  tree.root!.children.add(TreeNode(2));
  tree.root!.children.add(TreeNode(3));
  tree.root!.children[0].children.add(TreeNode(4));
  tree.root!.children[0].children.add(TreeNode(5));

  List<int> path = [];
  bool found = tree.findPath(tree.root, path, 5);

  if (found) {
    print("Path to 5: $path");
  } else {
    print("Value not found in the tree.");
  }
}
