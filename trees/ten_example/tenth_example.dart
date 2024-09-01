enum NodeColor { red, black }

class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;
  NodeColor color;

  TreeNode(this.value, this.color);
}

class RedBlackTree {
  TreeNode? root;

  TreeNode? rotateLeft(TreeNode? node) {
    TreeNode? temp = node?.right;
    node?.right = temp?.left;
    temp?.left = node;
    temp?.color = node?.color ?? NodeColor.black;
    node?.color = NodeColor.red;
    return temp;
  }

  TreeNode? rotateRight(TreeNode? node) {
    TreeNode? temp = node?.left;
    node?.left = temp?.right;
    temp?.right = node;
    temp?.color = node?.color ?? NodeColor.black;
    node?.color = NodeColor.red;
    return temp;
  }

  void flipColors(TreeNode? node) {
    node?.color = NodeColor.red;
    node?.left?.color = NodeColor.black;
    node?.right?.color = NodeColor.black;
  }

  bool isRed(TreeNode? node) {
    return node?.color == NodeColor.red;
  }

  TreeNode? insert(TreeNode? node, int value) {
    if (node == null) return TreeNode(value, NodeColor.red);

    if (value < node.value) {
      node.left = insert(node.left, value);
    } else if (value > node.value) {
      node.right = insert(node.right, value);
    } else {
      node.value = value;
    }

    if (isRed(node.right) && !isRed(node.left)) {
      node = rotateLeft(node);
    }

    if (isRed(node.left) && isRed(node.left?.left)) {
      node = rotateRight(node);
    }

    if (isRed(node.left) && isRed(node.right)) {
      flipColors(node);
    }

    return node;
  }

  void inOrderTraversal(TreeNode? node) {
    if (node == null) return;

    inOrderTraversal(node.left);
    print(node.value);
    inOrderTraversal(node.right);
  }
}

void main() {
  RedBlackTree tree = RedBlackTree();
  tree.root = tree.insert(tree.root, 10);
  tree.root = tree.insert(tree.root, 20);
  tree.root = tree.insert(tree.root, 30);
  tree.root = tree.insert(tree.root, 15);
  tree.root = tree.insert(tree.root, 25);

  print("In-order traversal of the Red-Black Tree:");
  tree.inOrderTraversal(tree.root);
}
