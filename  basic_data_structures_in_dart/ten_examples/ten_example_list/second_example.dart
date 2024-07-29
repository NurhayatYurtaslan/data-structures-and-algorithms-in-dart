void main() {
  // Class roster
  List<String> classRoster = ['John', 'Emily', 'Michael', 'Sophia'];

  // Remove a student from the class roster
  removeStudent(classRoster, 'Michael');

  // Print the class roster
  print('Class Roster:');
  for (var student in classRoster) {
    print('- $student');
  }
}

// Method to remove a student from the class roster
void removeStudent(List<String> list, String student) {
  list.remove(student);
}
