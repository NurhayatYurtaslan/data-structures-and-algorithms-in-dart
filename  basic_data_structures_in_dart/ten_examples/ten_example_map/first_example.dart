void main() {
  // Create a map to store student grades
  Map<String, double> studentGrades = {
    'Alice': 85.5,
    'Bob': 92.0,
    'Charlie': 78.0,
  };

  // Access and print a specific student's grade
  String studentName = 'Alice';
  if (studentGrades.containsKey(studentName)) {
    print('$studentName\'s grade: ${studentGrades[studentName]}');
  } else {
    print('Grade for $studentName not found.');
  }

  // Print all student grades
  print('All student grades:');
  studentGrades.forEach((name, grade) {
    print('$name: $grade');
  });
}
