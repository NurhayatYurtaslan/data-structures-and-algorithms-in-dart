import 'dart:collection';

void main() {
  // Create a list of tasks
  List<Task> tasks = [
    Task('Finish project', 1, DateTime(2024, 8, 3)),
    Task('Pay bills', 3, DateTime(2024, 7, 30)),
    Task('Schedule doctor appointment', 2, DateTime(2024, 8, 7)),
    Task('Grocery shopping', 2, DateTime(2024, 8, 2)),
    Task('Call mom', 3, DateTime(2024, 8, 1)),
  ];

  // Sort tasks by priority
  tasks.sort((a, b) => a.priority.compareTo(b.priority));

  // Filter tasks due within the next week
  List<Task> upcomingTasks = getTasksDueWithinWeek(tasks);

  // Print the sorted and filtered tasks
  print('Tasks Due Within Next Week:');
  for (var task in upcomingTasks) {
    print('- ${task.name} (Priority: ${task.priority}, Due: ${task.dueDate.toLocal()})');
  }
}

// Task class to hold task details
class Task {
  String name;
  int priority;
  DateTime dueDate;

  Task(this.name, this.priority, this.dueDate);
}

// Method to filter tasks due within the next week
List<Task> getTasksDueWithinWeek(List<Task> tasks) {
  DateTime now = DateTime.now();
  DateTime weekFromNow = now.add(Duration(days: 7));

  return tasks.where((task) => task.dueDate.isAfter(now) && task.dueDate.isBefore(weekFromNow)).toList();
}
