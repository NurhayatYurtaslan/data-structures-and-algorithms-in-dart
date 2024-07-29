void main() {
  // Create a graph with edges
  Map<String, Set<String>> graph = {
    'A': {'B', 'C'},
    'B': {'A', 'D', 'E'},
    'C': {'A', 'F'},
    'D': {'B'},
    'E': {'B', 'F'},
    'F': {'C', 'E'},
  };

  // Perform a depth-first search
  List<String> visitedNodes = depthFirstSearch(graph, 'A');

  // Print the nodes visited in DFS order
  print('DFS Traversal: $visitedNodes');
}

// Function to perform a depth-first search on a graph
List<String> depthFirstSearch(Map<String, Set<String>> graph, String startNode) {
  Set<String> visited = {};
  List<String> result = [];

  void dfs(String node) {
    if (visited.contains(node)) return;

    visited.add(node);
    result.add(node);

    for (var neighbor in graph[node]!) {
      dfs(neighbor);
    }
  }

  dfs(startNode);
  return result;
}
