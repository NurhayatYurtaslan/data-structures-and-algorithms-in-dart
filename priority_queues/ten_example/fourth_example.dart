import 'dart:collection';

class Task {
  String name;
  int priority;
  
  Task(this.name, this.priority);
}

class TaskManager {
  PriorityQueue<Task> _taskQueue;

  TaskManager() {
    _taskQueue = PriorityQueue<Task>((a, b) => a.priority.compareTo(b.priority));
  }

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
