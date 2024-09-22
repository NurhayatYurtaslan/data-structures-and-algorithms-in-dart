class MedianFinder {
  List<int> minHeap = [];
  List<int> maxHeap = [];

  void addNum(int num) {
    if (maxHeap.isEmpty || num <= maxHeap[0]) {
      maxHeap.add(num);
      _heapifyUp(maxHeap, maxHeap.length - 1, false);
    } else {
      minHeap.add(num);
      _heapifyUp(minHeap, minHeap.length - 1, true);
    }

    if (maxHeap.length > minHeap.length + 1) {
      minHeap.add(_extractTop(maxHeap, false));
      _heapifyUp(minHeap, minHeap.length - 1, true);
    } else if (minHeap.length > maxHeap.length) {
      maxHeap.add(_extractTop(minHeap, true));
      _heapifyUp(maxHeap, maxHeap.length - 1, false);
    }
  }

  double findMedian() {
    if (maxHeap.length > minHeap.length) {
      return maxHeap[0].toDouble();
    }
    return (maxHeap[0] + minHeap[0]) / 2;
  }

  int _extractTop(List<int> heap, bool isMinHeap) {
    int top = heap[0];
    heap[0] = heap.removeLast();
    _heapifyDown(heap, 0, isMinHeap);
    return top;
  }

  void _heapifyUp(List<int> heap, int index, bool isMinHeap) {
    while (index > 0) {
      int parent = (index - 1) ~/ 2;
      if ((isMinHeap && heap[index] < heap[parent]) || (!isMinHeap && heap[index] > heap[parent])) {
        _swap(heap, index, parent);
        index = parent;
      } else {
        break;
      }
    }
  }

  void _heapifyDown(List<int> heap, int index, bool isMinHeap) {
    int size = heap.length;
    while (index < size) {
      int left = 2 * index + 1;
      int right = 2 * index + 2;
      int chosen = index;

      if (left < size && (isMinHeap ? heap[left] < heap[chosen] : heap[left] > heap[chosen])) {
        chosen = left;
      }

      if (right < size && (isMinHeap ? heap[right] < heap[chosen] : heap[right] > heap[chosen])) {
        chosen = right;
      }

      if (chosen != index) {
        _swap(heap, index, chosen);
        index = chosen;
      } else {
        break;
      }
    }
  }

  void _swap(List<int> heap, int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main() {
  MedianFinder mf = MedianFinder();
  mf.addNum(3);
  mf.addNum(5);
  mf.addNum(1);
  print("Median: ${mf.findMedian()}"); // 3

  mf.addNum(6);
  print("Median: ${mf.findMedian()}"); // 4.0
}
