class Task {
  String name;
  int priority;
  
  Task(this.name, this.priority);
}

class CustomPriorityQueue {
  List<Task> _queue = [];

  // Görevleri öncelik sırasına göre ekle ve sırala
  void add(Task task) {
    _queue.add(task);
    _queue.sort((a, b) => a.priority.compareTo(b.priority)); // Önceliğe göre sırala
  }

  // İlk görevi çıkarma (en yüksek öncelik)
  Task removeFirst() {
    if (_queue.isNotEmpty) {
      return _queue.removeAt(0);
    } else {
      throw Exception('Queue is empty');
    }
  }

  bool get isNotEmpty => _queue.isNotEmpty;
}

class TaskManager {
  CustomPriorityQueue _taskQueue = CustomPriorityQueue(); // PriorityQueue yerine CustomPriorityQueue

  void addTask(String name, int priority) {
    _taskQueue.add(Task(name, priority));
  }

  void executeTasks() {
    while (_taskQueue.isNotEmpty) {
      var task = _taskQueue.removeFirst();
      print('Executing ${task.name} with priority ${task.priority}');
    }
  }
}

void main() {
  var manager = TaskManager();
  manager.addTask('Task 1', 2);
  manager.addTask('Task 3', 3);
  manager.addTask('Task 2', 1);
  
  manager.executeTasks(); // Task 2, Task 1, Task 3
}
