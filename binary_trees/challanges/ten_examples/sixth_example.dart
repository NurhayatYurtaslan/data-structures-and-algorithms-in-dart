class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  int findMax(Node? node) {
    if (node == null) return -1;

    int res = node.value;
    int leftRes = findMax(node.left);
    int rightRes = findMax(node.right);

    if (leftRes > res) res = leftRes;
    if (rightRes > res) res = rightRes;

    return res;
  }
}

void main() {
  // Binary tree oluşturma
  BinaryTree tree = BinaryTree();
  tree.root = Node(1);
  tree.root!.left = Node(2);
  tree.root!.right = Node(3);
  tree.root!.left!.left = Node(4);
  tree.root!.left!.right = Node(5);

  // Ağaçtaki en büyük değeri bulma
  int maxValue = tree.findMax(tree.root);
  print("Maximum value in the tree: $maxValue");
}
