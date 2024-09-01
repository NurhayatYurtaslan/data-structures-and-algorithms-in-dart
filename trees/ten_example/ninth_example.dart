class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;
  int height;

  TreeNode(this.value) : height = 1;
}

class AVLTree {
  TreeNode? root;

  int height(TreeNode? node) {
    return node?.height ?? 0;
  }

  int max(int a, int b) {
    return (a > b) ? a : b;
  }

  TreeNode? rotateRight(TreeNode? y) {
    TreeNode? x = y?.left;
    TreeNode? T2 = x?.right;

    x?.right = y;
    y?.left = T2;

    y?.height = max(height(y.left), height(y.right)) + 1;
    x?.height = max(height(x.left), height(x.right)) + 1;

    return x;
  }

  TreeNode? rotateLeft(TreeNode? x) {
    TreeNode? y = x?.right;
    TreeNode? T2 = y?.left;

    y?.left = x;
    x?.right = T2;

    x?.height = max(height(x.left), height(x.right)) + 1;
    y?.height = max(height(y.left), height(y.right)) + 1;

    return y;
  }

  int getBalance(TreeNode? node) {
    if (node == null) return 0;
    return height(node.left) - height(node.right);
  }

  TreeNode? insert(TreeNode? node, int value) {
    if (node == null) return TreeNode(value);

    if (value < node.value) {
      node.left = insert(node.left, value);
    } else if (value > node.value) {
      node.right = insert(node.right, value);
    } else {
      return node;
    }

    node.height = 1 + max(height(node.left), height(node.right));

    int balance = getBalance(node);

    if (balance > 1 && value < node.left!.value) {
      return rotateRight(node);
    }

    if (balance < -1 && value > node.right!.value) {
      return rotateLeft(node);
    }

    if (balance > 1 && value > node.left!.value) {
      node.left = rotateLeft(node.left);
      return rotateRight(node);
    }

    if (balance < -1 && value < node.right!.value) {
      node.right = rotateRight(node.right);
      return rotateLeft(node);
    }

    return node;
  }

  void preOrder(TreeNode? node) {
    if (node != null) {
      print("${node.value} ");
      preOrder(node.left);
      preOrder(node.right);
    }
  }
}

void main() {
  AVLTree tree = AVLTree();

  tree.root = tree.insert(tree.root, 10);
  tree.root = tree.insert(tree.root, 20);
  tree.root = tree.insert(tree.root, 30);
  tree.root = tree.insert(tree.root, 40);
  tree.root = tree.insert(tree.root, 50);
  tree.root = tree.insert(tree.root, 25);

  print("Preorder traversal of the constructed AVL tree is:");
  tree.preOrder(tree.root);
}
