void main() {
  // Create a graph with adjacency list
  Map<String, List<String>> graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': ['F'],
    'F': [],
  };

  // Perform DFS starting from node 'A'
  List<String> result = depthFirstSearch(graph, 'A');
  
  // Print the traversal result
  print('DFS Traversal: $result');
}

// Function to perform DFS using stack
List<String> depthFirstSearch(Map<String, List<String>> graph, String start) {
  Stack<String> stack = Stack();
  List<String> visited = [];

  stack.push(start);

  while (!stack.isEmpty) {
    String node = stack.pop();

    if (!visited.contains(node)) {
      visited.add(node);

      // Push all adjacent nodes onto the stack
      for (var neighbor in graph[node]!) {
        stack.push(neighbor);
      }
    }
  }

  return visited;
}

// Stack class definition
class Stack<T> {
  List<T> _stack = [];

  void push(T value) {
    _stack.add(value);
  }

  T pop() {
    if (_stack.isEmpty) {
      throw Exception('Stack is empty');
    }
    return _stack.removeLast();
  }

  bool get isEmpty => _stack.isEmpty;
}
