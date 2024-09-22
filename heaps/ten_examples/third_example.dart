class MinHeap {
  List<int> heap = [];

  void insert(int value) {
    heap.add(value);
    _heapifyUp(heap.length - 1);
  }

  int extractMin() {
    if (heap.isEmpty) {
      throw Exception("Heap is empty");
    }

    int minValue = heap[0];
    heap[0] = heap.removeLast();
    _heapifyDown(0);
    return minValue;
  }

  void _heapifyUp(int index) {
    if (index == 0) return;

    int parentIndex = (index - 1) ~/ 2;
    if (heap[index] < heap[parentIndex]) {
      _swap(index, parentIndex);
      _heapifyUp(parentIndex);
    }
  }

  void _heapifyDown(int index) {
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
    int smallestIndex = index;

    if (leftChildIndex < heap.length && heap[leftChildIndex] < heap[smallestIndex]) {
      smallestIndex = leftChildIndex;
    }

    if (rightChildIndex < heap.length && heap[rightChildIndex] < heap[smallestIndex]) {
      smallestIndex = rightChildIndex;
    }

    if (smallestIndex != index) {
      _swap(index, smallestIndex);
      _heapifyDown(smallestIndex);
    }
  }

  void _swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.insert(10);
  minHeap.insert(5);
  minHeap.insert(30);
  minHeap.insert(1);

  print("Minimum value removed: ${minHeap.extractMin()}");
  print("Minimum value now: ${minHeap.heap[0]}");
}
