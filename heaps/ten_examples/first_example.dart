class MinHeap {
  List<int> heap = [];

  void insert(int value) {
    heap.add(value);
    _heapifyUp(heap.length - 1);
  }

  void _heapifyUp(int index) {
    if (index == 0) return;

    int parentIndex = (index - 1) ~/ 2;
    if (heap[index] < heap[parentIndex]) {
      _swap(index, parentIndex);
      _heapifyUp(parentIndex);
    }
  }

  void _swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  int getMin() {
    if (heap.isEmpty) {
      throw Exception("Heap is empty");
    }
    return heap[0];
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.insert(10);
  minHeap.insert(5);
  minHeap.insert(30);
  minHeap.insert(1);

  print("Minimum value in the heap: ${minHeap.getMin()}");
}
