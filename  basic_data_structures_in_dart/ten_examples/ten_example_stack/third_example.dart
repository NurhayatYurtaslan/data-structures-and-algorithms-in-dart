void main() {
  // Sample string
  String input = 'Dart is fun';

  // Reverse the string using stack
  String reversed = reverseString(input);

  // Print the original and reversed strings
  print('Original String: $input');
  print('Reversed String: $reversed');
}

// Function to reverse a string using stack
String reverseString(String input) {
  Stack<String> stack = Stack();

  // Push each character onto the stack
  for (var char in input.split('')) {
    stack.push(char);
  }

  // Pop characters from the stack to form the reversed string
  StringBuffer reversedBuffer = StringBuffer();
  while (!stack.isEmpty) {
    reversedBuffer.write(stack.pop());
  }

  return reversedBuffer.toString();
}

// Stack class definition
class Stack<T> {
  List<T> _stack = [];

  void push(T value) {
    _stack.add(value);
  }

  T pop() {
    if (_stack.isEmpty) {
      throw Exception('Stack is empty');
    }
    return _stack.removeLast();
  }

  bool get isEmpty => _stack.isEmpty;
}
