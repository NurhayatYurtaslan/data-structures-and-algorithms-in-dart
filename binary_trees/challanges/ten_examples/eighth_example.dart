class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  Node? sortedArrayToBST(List<int> arr, int start, int end) {
    if (start > end) return null;

    int mid = (start + end) ~/ 2;
    Node node = Node(arr[mid]);

    node.left = sortedArrayToBST(arr, start, mid - 1);
    node.right = sortedArrayToBST(arr, mid + 1, end);

    return node;
  }

  void inorderTraversal(Node? node) {
    if (node == null) return;
    inorderTraversal(node.left);
    print(node.value);
    inorderTraversal(node.right);
  }
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7];
  
  BinaryTree tree = BinaryTree();
  tree.root = tree.sortedArrayToBST(arr, 0, arr.length - 1);

  print("Inorder traversal of the balanced BST:");
  tree.inorderTraversal(tree.root);
}
