import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val, [this.left, this.right]);
}

int getHeight(TreeNode? root) {
  if (root == null) {
    return 0;
  }

  int leftHeight = getHeight(root.left);
  int rightHeight = getHeight(root.right);

  return 1 + max(leftHeight, rightHeight).toInt();
}

void main() {
  // Construct the binary tree
  TreeNode root = TreeNode(15);
  root.left = TreeNode(1);
  root.right = TreeNode(17);
  root.right?.right = TreeNode(20);
  root.left?.left = TreeNode(5);
  root.left?.right = TreeNode(0);
  root.right?.left = TreeNode(2);
  root.left?.left?.left = TreeNode(5);
  root.left?.left?.right = TreeNode(7);

  // Get the height of the binary tree
  int height = getHeight(root);
  print("Height of the binary tree: $height");
}
