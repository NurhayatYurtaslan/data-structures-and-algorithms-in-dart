class Student {
  String name;
  double grade;

  Student(this.name, this.grade);
}

void quickSort(List<Student> arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);

    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int partition(List<Student> arr, int low, int high) {
  Student pivot = arr[high];
  int i = (low - 1);

  for (int j = low; j < high; j++) {
    if (arr[j].grade <= pivot.grade) {
      i++;
      Student temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  Student temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

void main() {
  List<Student> students = [
    Student("Alice", 85.5),
    Student("Bob", 72.0),
    Student("Charlie", 90.3),
    Student("Diana", 78.5),
  ];
  print("Before sorting:");
  students.forEach((s) => print("${s.name}: ${s.grade}"));

  quickSort(students, 0, students.length - 1);

  print("\nAfter sorting:");
  students.forEach((s) => print("${s.name}: ${s.grade}"));
}
