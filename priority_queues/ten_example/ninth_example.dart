class Task {
  String name;
  int priority; // 1: en yüksek, 5: en düşük
  int duration; // Görev süresi (dakika)

  Task(this.name, this.priority, this.duration);
}

class CustomPriorityQueue {
  List<Task> _queue = [];

  // Görevleri öncelik ve süreye göre sıralıyoruz
  void add(Task task) {
    _queue.add(task);
    _queue.sort((a, b) {
      int priorityComparison = a.priority.compareTo(b.priority);
      return priorityComparison != 0 ? priorityComparison : a.duration.compareTo(b.duration);
    });
  }

  // İlk görevi çıkarma (en yüksek öncelik ve kısa süre)
  Task removeFirst() {
    if (_queue.isNotEmpty) {
      return _queue.removeAt(0); // İlk görevi çıkar
    } else {
      throw Exception('Queue is empty');
    }
  }

  bool get isNotEmpty => _queue.isNotEmpty;
}

class TaskScheduler {
  CustomPriorityQueue _taskQueue = CustomPriorityQueue(); // PriorityQueue yerine CustomPriorityQueue

  void addTask(String name, int priority, int duration) {
    _taskQueue.add(Task(name, priority, duration));
  }

  void scheduleTasks() {
    while (_taskQueue.isNotEmpty) {
      var task = _taskQueue.removeFirst();
      print('Scheduling task: ${task.name}, Priority: ${task.priority}, Duration: ${task.duration} min');
    }
  }
}

void main() {
  var scheduler = TaskScheduler();
  scheduler.addTask('Write report', 2, 30);
  scheduler.addTask('Fix bugs', 1, 60);
  scheduler.addTask('Code review', 2, 15);
  
  scheduler.scheduleTasks(); // Fix bugs, Code review, Write report
}
