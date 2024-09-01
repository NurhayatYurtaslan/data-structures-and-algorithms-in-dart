class TreeNode {
  int value;
  List<TreeNode> children;

  TreeNode(this.value) : children = [];
}

class Tree {
  TreeNode? root;

  int countNodes(TreeNode? node) {
    if (node == null) return 0;

    int count = 1;
    for (TreeNode child in node.children) {
      count += countNodes(child);
    }
    return count;
  }
}

void main() {
  // Tree yapısı oluşturma
  Tree tree = Tree();
  tree.root = TreeNode(1);
  tree.root!.children.add(TreeNode(2));
  tree.root!.children.add(TreeNode(3));
  tree.root!.children[0].children.add(TreeNode(4));
  tree.root!.children[0].children.add(TreeNode(5));

  // Toplam düğüm sayısını bulma
  int totalNodes = tree.countNodes(tree.root);
  print("Total nodes in the tree: $totalNodes");
}
