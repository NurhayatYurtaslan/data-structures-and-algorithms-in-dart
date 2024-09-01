class TreeNode {
  int value;
  List<TreeNode> children;

  TreeNode(this.value) : children = [];
}

class Tree {
  TreeNode? root;

  void preorderTraversal(TreeNode? node) {
    if (node == null) return;

    print(node.value);
    for (TreeNode child in node.children) {
      preorderTraversal(child);
    }
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

  // Preorder dolaşım
  print("Preorder traversal:");
  tree.preorderTraversal(tree.root);
}
