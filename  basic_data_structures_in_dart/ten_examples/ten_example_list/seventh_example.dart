void main() {
  // List of tasks
  List<Task> tasks = [
    Task('Write report', false),
    Task('Attend meeting', false),
    Task('Submit assignment', true),
    Task('Email client', true),
    Task('Prepare presentation', false),
  ];

  // Mark a task as completed
  markTaskAsCompleted(tasks, 'Attend meeting');

  // Get completed tasks
  List<Task> completedTasks = getCompletedTasks(tasks);

  // Print completed tasks
  print('Completed Tasks:');
  for (var task in completedTasks) {
    print('- ${task.name}');
  }
}

// Task class to hold task details
class Task {
  String name;
  bool isCompleted;

  Task(this.name, this.isCompleted);
}

// Method to mark a task as completed
void markTaskAsCompleted(List<Task> tasks, String taskName) {
  for (var task in tasks) {
    if (task.name == taskName) {
      task.isCompleted = true;
      break;
    }
  }
}

// Method to get completed tasks
List<Task> getCompletedTasks(List<Task> tasks) {
  return tasks.where((task) => task.isCompleted).toList();
}
