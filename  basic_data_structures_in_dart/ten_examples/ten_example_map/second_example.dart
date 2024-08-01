import 'dart:collection';

void main(){
  Map<String,double> studentGrades={
    'Alice':85.5,
    'Bob':92.0,
    'Charlie':78.0,
  };
  
  final hashMap= HashMap.of(studentGrades);
  print(hashMap);
  
  String studentName = 'John';
  
  if(hashMap.containsKey(studentName)){
    hashMap['Bob']=99;
    print(hashMap);
    print(studentGrades);
  }else{
    hashMap['john']=88;
    print(hashMap);
    print(studentGrades);
  }
}
