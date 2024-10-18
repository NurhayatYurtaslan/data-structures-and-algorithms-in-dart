class Student {
  String name;
  int grade;
  int age;

  Student(this.name, this.grade, this.age);

  @override
  String toString() {
    return '$name: Grade $grade, Age $age';
  }
}

void merge(List<Student> students, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;

  List<Student> leftArray = List.generate(n1, (index) => students[left + index]);
  List<Student> rightArray = List.generate(n2, (index) => students[mid + 1 + index]);

  int i = 0, j = 0, k = left;

  while (i < n1 && j < n2) {
    if (leftArray[i].grade < rightArray[j].grade || 
        (leftArray[i].grade == rightArray[j].grade && leftArray[i].age <= rightArray[j].age)) {
      students[k] = leftArray[i];
      i++;
    } else {
      students[k] = rightArray[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    students[k] = leftArray[i];
    i++;
    k++;
  }

  while (j < n2) {
    students[k] = rightArray[j];
    j++;
    k++;
  }
}

void mergeSort(List<Student> students, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;

    mergeSort(students, left, mid);
    mergeSort(students, mid + 1, right);

    merge(students, left, mid, right);
  }
}

void main() {
  List<Student> students = [
    Student('Alice', 85, 20),
    Student('Bob', 75, 19),
    Student('Charlie', 85, 22),
    Student('David', 95, 21),
    Student('Eve', 95, 20),
  ];

  print("Before sorting:");
  students.forEach(print);

  mergeSort(students, 0, students.length - 1);

  print("\nAfter sorting:");
  students.forEach(print);
}
