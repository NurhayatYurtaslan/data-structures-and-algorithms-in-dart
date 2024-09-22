class Task {
  String name;
  int priority;

  Task(this.name, this.priority);

  @override
  String toString() {
    return '$name (Priority: $priority)';
  }
}

class PriorityQueue {
  List<Task> heap = [];

  void addTask(Task task) {
    heap.add(task);
    _heapifyUp(heap.length - 1);
  }

  Task extractHighestPriority() {
    if (heap.isEmpty) {
      throw Exception("Heap is empty");
    }

    Task highestPriorityTask = heap[0];
    heap[0] = heap.removeLast();
    _heapifyDown(0);
    return highestPriorityTask;
  }

  void _heapifyUp(int index) {
    if (index == 0) return;

    int parentIndex = (index - 1) ~/ 2;
    if (heap[index].priority > heap[parentIndex].priority) {
      _swap(index, parentIndex);
      _heapifyUp(parentIndex);
    }
  }

  void _heapifyDown(int index) {
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
    int largestIndex = index;

    if (leftChildIndex < heap.length && heap[leftChildIndex].priority > heap[largestIndex].priority) {
      largestIndex = leftChildIndex;
    }

    if (rightChildIndex < heap.length && heap[rightChildIndex].priority > heap[largestIndex].priority) {
      largestIndex = rightChildIndex;
    }

    if (largestIndex != index) {
      _swap(index, largestIndex);
      _heapifyDown(largestIndex);
    }
  }

  void _swap(int index1, int index2) {
    Task temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  bool get isEmpty => heap.isEmpty;
}

void main() {
  PriorityQueue queue = PriorityQueue();

  queue.addTask(Task('Task A', 3));
  queue.addTask(Task('Task B', 1));
  queue.addTask(Task('Task C', 2));
  queue.addTask(Task('Task D', 5));

  while (!queue.isEmpty) {
    Task highestPriorityTask = queue.extractHighestPriority();
    print('Processing: $highestPriorityTask');
  }
}
