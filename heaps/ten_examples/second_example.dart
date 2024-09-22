class MaxHeap {
  List<int> heap = [];

  void insert(int value) {
    heap.add(value);
    _heapifyUp(heap.length - 1);
  }

  void _heapifyUp(int index) {
    if (index == 0) return;

    int parentIndex = (index - 1) ~/ 2;
    if (heap[index] > heap[parentIndex]) {
      _swap(index, parentIndex);
      _heapifyUp(parentIndex);
    }
  }

  void _swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  int getMax() {
    if (heap.isEmpty) {
      throw Exception("Heap is empty");
    }
    return heap[0];
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.insert(20);
  maxHeap.insert(50);
  maxHeap.insert(15);
  maxHeap.insert(100);

  print("Maximum value in the heap: ${maxHeap.getMax()}");
}
