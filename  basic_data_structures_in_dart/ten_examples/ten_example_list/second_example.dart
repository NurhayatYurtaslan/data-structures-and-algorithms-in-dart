void main() {
List<String> classRoster = ['John', 'Emily', 'Michael', 'Sophia'];
  print(classRoster);
  removeStudent(classRoster, 'Michael');
  print('Class Roster: ');
  for(var student in classRoster){
    print('-$student');
  }
  addStudent(classRoster, 'Mahmoud');
  print('New Class Roster:');
  
  for(var student in classRoster){
    print('-$student');
  }
}

void removeStudent(List<String> list, String student){
  list.remove(student);
}

void addStudent(List<String> list, String student){
  list.add(student);
}
