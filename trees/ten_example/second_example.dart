class TreeNode {
  int value;
  List<TreeNode> children;

  TreeNode(this.value) : children = [];
}

class Tree {
  TreeNode? root;

  bool contains(TreeNode? node, int value) {
    if (node == null) return false;
    if (node.value == value) return true;

    for (TreeNode child in node.children) {
      if (contains(child, value)) return true;
    }
    return false;
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

  // Bir değerin ağaçta olup olmadığını kontrol etme
  bool isPresent = tree.contains(tree.root, 4);
  print("Is value 4 present in the tree? $isPresent");
}
