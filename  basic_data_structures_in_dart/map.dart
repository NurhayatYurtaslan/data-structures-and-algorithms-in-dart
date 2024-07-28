import 'dart:collection';
void main() {
  final scores = {'Eric': 9, 'Mark': 12, 'Wayne': 1};
  print(scores);
  //add new 
  scores['Andrew'] = 0;
  print(scores);
  //hashMap
  final hashMap = HashMap.of(scores);
  print(hashMap);
}
