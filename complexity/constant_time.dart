void checkFirst(List<String> names) {
  if (names.isNotEmpty) {
    print(names.first);
  } else {
    print('no names');
  }
}

void main() {

  List<String> names = [
    'Alice', 'Bob', 'Charlie', 'David', 'Eve', 
    'Frank', 'Grace', 'Hannah', 'Ivy', 'Jack'
  ];

  
  DateTime start1 = DateTime.now();
  checkFirst(names);
  DateTime end1 = DateTime.now();
  Duration duration1 = end1.difference(start1);
  print('Time: ${duration1.inMicroseconds} mikro seconds');

}
