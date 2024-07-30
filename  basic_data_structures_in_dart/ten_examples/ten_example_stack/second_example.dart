void main() {
  // Sample expression
  String expression = '(2 + 3) * (4 - (5 / 2))';

  // Check if the parentheses are balanced
  bool isBalanced = areParenthesesBalanced(expression);

  // Print the result
  print('Expression: $expression');
  print('Parentheses Balanced: $isBalanced');
}

// Function to check if parentheses are balanced
bool areParenthesesBalanced(String expression) {
  Stack<String> stack = Stack();

  for (var char in expression.split('')) {
    if (char == '(') {
      stack.push(char);
    } else if (char == ')') {
      if (stack.isEmpty) {
        return false;
      }
      stack.pop();
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
