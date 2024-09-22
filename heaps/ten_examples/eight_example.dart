class DynamicMedian {
  List<int> minHeap = [];
  List<int> maxHeap = [];

  void addNumber(int num) {
    if (maxHeap.isEmpty || num <= maxHeap[0]) {
      maxHeap.add(num);
      _heapifyUp(maxHeap, maxHeap.length - 1, isMinHeap: false);
    } else {
      minHeap.add(num);
      _heapifyUp(minHeap, minHeap.length - 1, isMinHeap: true);
    }

    // Dengelenmesi gerekirse
    if (maxHeap.length > minHeap.length + 1) {
      int top = _extractTop(maxHeap, isMinHeap: false);
      minHeap.add(top);
      _heapifyUp(minHeap, minHeap.length - 1, isMinHeap: true);
    } else if (minHeap.length > maxHeap.length) {
      int top = _extractTop(minHeap, isMinHeap: true);
      maxHeap.add(top);
      _heapifyUp(maxHeap, maxHeap.length - 1, isMinHeap: false);
    }
  }

  double findMedian() {
    if (maxHeap.length > minHeap.length) {
      return maxHeap[0].toDouble();
    } else {
      return (maxHeap[0] + minHeap[0]) / 2.0;
    }
  }

  int _extractTop(List<int> heap, {required bool isMinHeap}) {
    int top = heap[0];
    heap[0] = heap.removeLast();
    _heapifyDown(heap, 0, isMinHeap: isMinHeap);
    return top;
  }

  void _heapifyUp(List<int> heap, int index, {required bool isMinHeap}) {
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

  void _heapifyDown(List<int> heap, int index, {required bool isMinHeap}) {
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
  DynamicMedian dynamicMedian = DynamicMedian();
  List<int> numbers = [5, 15, 1, 3, 2, 8, 7];

  for (int num in numbers) {
    dynamicMedian.addNumber(num);
    print("Added: $num, Median: ${dynamicMedian.findMedian()}");
  }
}
