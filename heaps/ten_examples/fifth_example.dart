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

  void merge(MinHeap otherHeap) {
    for (var value in otherHeap.heap) {
      insert(value);
    }
  }

  void printHeap() {
    print(heap);
  }
}

void main() {
  MinHeap heap1 = MinHeap();
  heap1.insert(10);
  heap1.insert(5);
  heap1.insert(20);

  MinHeap heap2 = MinHeap();
  heap2.insert(7);
  heap2.insert(12);
  heap2.insert(3);

  print("Heap 1 before merge:");
  heap1.printHeap();

  print("Heap 2 before merge:");
  heap2.printHeap();

  heap1.merge(heap2);

  print("Heap 1 after merging with Heap 2:");
  heap1.printHeap();
}
