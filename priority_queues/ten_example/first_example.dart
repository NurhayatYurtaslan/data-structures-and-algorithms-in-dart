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
  List<Task> queue = [];

  void addTask(Task task) {
    queue.add(task);
    queue.sort((a, b) => b.priority.compareTo(a.priority));  // Önceliğe göre sıralama
  }

  Task? getHighestPriorityTask() {
    return queue.isNotEmpty ? queue.removeAt(0) : null; // En yüksek öncelikli görevi çıkar
  }
}

void main() {
  PriorityQueue queue = PriorityQueue();
  queue.addTask(Task('Task A', 2));
  queue.addTask(Task('Task B', 5));
  queue.addTask(Task('Task C', 3));

  while (queue.queue.isNotEmpty) {
    Task? task = queue.getHighestPriorityTask();
    print('Processing: $task');
  }
}
