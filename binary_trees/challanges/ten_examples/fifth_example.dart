class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  bool contains(Node? node, int value) {
    if (node == null) return false;
    if (node.value == value) return true;

    return contains(node.left, value) || contains(node.right, value);
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

  // Bir değerin ağaçta olup olmadığını kontrol etme
  bool isPresent = tree.contains(tree.root, 4);
  print("Is value 4 present in the tree? $isPresent");
}
