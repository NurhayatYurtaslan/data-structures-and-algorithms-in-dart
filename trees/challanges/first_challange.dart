import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val, {this.left, this.right});
}

String levelOrder(TreeNode? root) {
  if (root == null) return "";

  List<String> result = [];
  Queue<TreeNode?> queue = Queue();
  queue.add(root);

  while (queue.isNotEmpty) {
    int levelSize = queue.length;
    List<String> levelValues = [];

    for (int i = 0; i < levelSize; i++) {
      TreeNode? node = queue.removeFirst();
      if (node != null) {
        levelValues.add(node.val.toString());
        if (node.left != null) queue.add(node.left);
        if (node.right != null) queue.add(node.right);
      } else {
        levelValues.add("null");
      }
    }

    result.add(levelValues.join(" "));
  }

  return result.join("\n");
}

void main() {
  // Ağacı oluştur
  TreeNode root = TreeNode(15);
  root.left = TreeNode(1);
  root.right = TreeNode(17);
  root.right?.right = TreeNode(20);
  root.left?.left = TreeNode(5);
  root.left?.right = TreeNode(0);
  root.right?.left = TreeNode(2);
  root.left?.left?.left = TreeNode(5);
  root.left?.left?.right = TreeNode(7);

  print(levelOrder(root));
}
