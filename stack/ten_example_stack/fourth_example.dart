void main() {
  // Sample postfix expression
  String expression = '3 4 + 2 * 7 /';

  // Evaluate the postfix expression
  double result = evaluatePostfix(expression);

  // Print the result
  print('Postfix Expression: $expression');
  print('Evaluation Result: $result');
}

// Function to evaluate a postfix expression
double evaluatePostfix(String expression) {
  Stack<double> stack = Stack();

  // Split the expression into tokens
  List<String> tokens = expression.split(' ');

  for (var token in tokens) {
    if (isNumeric(token)) {
      // If the token is a number, push it onto the stack
      stack.push(double.parse(token));
    } else {
      // Otherwise, the token is an operator
      double operand2 = stack.pop();
      double operand1 = stack.pop();

      // Perform the operation and push the result back onto the stack
      switch (token) {
        case '+':
          stack.push(operand1 + operand2);
          break;
        case '-':
          stack.push(operand1 - operand2);
          break;
        case '*':
          stack.push(operand1 * operand2);
          break;
        case '/':
          stack.push(operand1 / operand2);
          break;
        default:
          throw Exception('Unsupported operator $token');
      }
    }
  }

  // The final result will be on the top of the stack
  return stack.pop();
}

// Helper function to check if a string is numeric
bool isNumeric(String s) {
  return double.tryParse(s) != null;
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
