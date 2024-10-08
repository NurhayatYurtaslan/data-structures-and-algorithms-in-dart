const int INF = 99999;

int minDistance(List<int> dist, List<bool> visited) {
  int min = INF, minIndex = -1;
  
  for (int v = 0; v < dist.length; v++) {
    if (!visited[v] && dist[v] <= min) {
      min = dist[v];
      minIndex = v;
    }
  }
  
  return minIndex;
}

void dijkstra(List<List<int>> graph, int src) {
  int n = graph.length;
  List<int> dist = List.filled(n, INF);
  List<bool> visited = List.filled(n, false);
  
  dist[src] = 0;

  for (int count = 0; count < n - 1; count++) {
    int u = minDistance(dist, visited);
    visited[u] = true;

    for (int v = 0; v < n; v++) {
      if (!visited[v] && graph[u][v] != 0 && dist[u] != INF && dist[u] + graph[u][v] < dist[v]) {
        dist[v] = dist[u] + graph[u][v];
      }
    }
  }

  print('Vertex \t Distance from Source');
  for (int i = 0; i < n; i++) {
    print('$i \t ${dist[i]}');
  }
}

void main() {
  List<List<int>> graph = [
    [0, 10, 20, 0, 0],
    [10, 0, 5, 16, 0],
    [20, 5, 0, 2, 8],
    [0, 16, 2, 0, 10],
    [0, 0, 8, 10, 0]
  ];

  dijkstra(graph, 0); // Kaynak düğüm 0
}
