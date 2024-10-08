const int INF = 99999;

void floydWarshall(List<List<int>> graph) {
  int n = graph.length;
  
  List<List<int>> dist = List.generate(n, (i) => List.from(graph[i]));

  for (int k = 0; k < n; k++) {
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (dist[i][k] + dist[k][j] < dist[i][j]) {
          dist[i][j] = dist[i][k] + dist[k][j];
        }
      }
    }
  }

  print('Shortest distances between every pair of vertices:');
  dist.forEach((row) => print(row));
}

void main() {
  List<List<int>> graph = [
    [0, 5, INF, 10],
    [INF, 0, 3, INF],
    [INF, INF, 0, 1],
    [INF, INF, INF, 0]
  ];

  floydWarshall(graph);
  // Output:
  // [0, 5, 8, 9]
  // [INF, 0, 3, 4]
  // [INF, INF, 0, 1]
  // [INF, INF, INF, 0]
}
