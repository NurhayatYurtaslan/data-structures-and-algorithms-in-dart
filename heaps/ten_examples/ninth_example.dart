import 'dart:collection';

class MinHeap {
  List<List<int>> heap = [];

  void insert(List<int> value) {
    heap.add(value);
    _heapifyUp(heap.length - 1);
  }

  List<int> extractMin() {
    if (heap.isEmpty) {
      throw Exception("Heap is empty");
    }

    List<int> minValue = heap[0];
    heap[0] = heap.removeLast();
    _heapifyDown(0);
    return minValue;
  }

  void _heapifyUp(int index) {
    if (index == 0) return;

    int parentIndex = (index - 1) ~/ 2;
    if (heap[index][1] < heap[parentIndex][1]) {
      _swap(index, parentIndex);
      _heapifyUp(parentIndex);
    }
  }

  void _heapifyDown(int index) {
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
    int smallestIndex = index;

    if (leftChildIndex < heap.length && heap[leftChildIndex][1] < heap[smallestIndex][1]) {
      smallestIndex = leftChildIndex;
    }

    if (rightChildIndex < heap.length && heap[rightChildIndex][1] < heap[smallestIndex][1]) {
      smallestIndex = rightChildIndex;
    }

    if (smallestIndex != index) {
      _swap(index, smallestIndex);
      _heapifyDown(smallestIndex);
    }
  }

  void _swap(int index1, int index2) {
    List<int> temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  bool get isEmpty => heap.isEmpty;
}

void dijkstra(Map<int, List<List<int>>> graph, int start) {
  MinHeap minHeap = MinHeap();
  Map<int, int> distances = {};
  Set<int> visited = {};

  for (int node in graph.keys) {
    distances[node] = double.infinity.toInt();
  }
  distances[start] = 0;
  minHeap.insert([start, 0]);

  while (!minHeap.isEmpty) {
    List<int> current = minHeap.extractMin();
    int currentNode = current[0];
    int currentDistance = current[1];

    if (visited.contains(currentNode)) continue;
    visited.add(currentNode);

    for (List<int> neighbor in graph[currentNode]!) {
      int neighborNode = neighbor[0];
      int edgeWeight = neighbor[1];
      int newDistance = currentDistance + edgeWeight;

      if (newDistance < distances[neighborNode]!) {
        distances[neighborNode] = newDistance;
        minHeap.insert([neighborNode, newDistance]);
      }
    }
  }

  print("Shortest distances from node $start:");
  distances.forEach((node, distance) {
    print("Node $node: $distance");
  });
}

void main() {
  Map<int, List<List<int>>> graph = {
    0: [[1, 4], [2, 1]],
    1: [[3, 1]],
    2: [[1, 2], [3, 5]],
    3: []
  };

  dijkstra(graph, 0);
}
