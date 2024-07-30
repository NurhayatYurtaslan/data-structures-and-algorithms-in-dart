void main() {
  // Create a graph and add edges
  Graph graph = Graph();
  graph.addEdge('A', 'B');
  graph.addEdge('A', 'C');
  graph.addEdge('B', 'D');
  graph.addEdge('C', 'D');
  graph.addEdge('D', 'E');

  // Perform DFS starting from node 'A'
  print('DFS Traversal starting from A:');
  graph.depthFirstSearch('A');
}

// Graph class representing the adjacency list
class Graph {
  Map<String, List<String>> adjacencyList = {};

  // Method to add an edge to the graph
  void addEdge(String source, String destination) {
    if (!adjacencyList.containsKey(source)) {
      adjacencyList[source] = [];
    }
    adjacencyList[source]!.add(destination);
  }

  // Method to perform DFS traversal
  void depthFirstSearch(String startNode) {
    Set<String> visited = {};
    _dfsHelper(startNode, visited);
  }

  // Helper method for DFS traversal
  void _dfsHelper(String node, Set<String> visited) {
    if (visited.contains(node)) return;

    visited.add(node);
    print(node);

    if (!adjacencyList.containsKey(node)) return;

    for (var neighbor in adjacencyList[node]!) {
      _dfsHelper(neighbor, visited);
    }
  }
}
