void main() {
  // Sample string with brackets
  String expression = '{[()]}';

  // Check if the brackets are balanced
  bool isBalanced = areBracketsBalanced(expression);

  // Print the result
  print('Expression: $expression');
  print('Brackets Balanced: $isBalanced');
}

// Function to check if brackets are balanced
bool areBracketsBalanced(String expression) {
  Stack<String> stack = Stack();
  Map<String, String> bracketPairs = {
    ')': '(',
    ']': '[',
    '}': '{',
  };

  for (var char in expression.split('')) {
    if (bracketPairs.containsValue(char)) {
      // If it's an opening bracket, push onto the stack
      stack.push(char);
    } else if (bracketPairs.containsKey(char)) {
      // If it's a closing bracket, check for a match
      if (stack.isEmpty || stack.pop() != bracketPairs[char]) {
        return false;
      }
    }
  }

  return stack.isEmpty;
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
