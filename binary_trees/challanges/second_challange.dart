class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val, [this.left, this.right]);
}

List<int?> serialize(TreeNode? root) {
  List<int?> result = [];
  _serialize(root, result);
  return result;
}

void _serialize(TreeNode? node, List<int?> result) {
  if (node == null) {
    result.add(null);
    return;
  }

  result.add(node.val);
  _serialize(node.left, result);
  _serialize(node.right, result);
}

TreeNode? deserialize(List<int?> data) {
  if (data.isEmpty) return null;
  return _deserialize(data);
}

TreeNode? _deserialize(List<int?> data) {
  if (data.isEmpty) return null;

  int? value = data.removeAt(0);
  if (value == null) return null;

  TreeNode node = TreeNode(value);
  node.left = _deserialize(data);
  node.right = _deserialize(data);
  return node;
}

void main() {
  List<int?> serializedData = [15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null];
  TreeNode? root = deserialize(serializedData);

  print("Deserialized tree:");
  _printTree(root);
}

void _printTree(TreeNode? node) {
  if (node == null) {
    print("null");
    return;
  }
  print(node.val);
  _printTree(node.left);
  _printTree(node.right);
}
