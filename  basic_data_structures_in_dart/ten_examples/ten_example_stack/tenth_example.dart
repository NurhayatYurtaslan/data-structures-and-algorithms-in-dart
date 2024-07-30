void main() {
  // Sample infix expression
  String expression = '(1 + (2 * 3) - (4 / 2))';

  // Evaluate the infix expression
  double result = evaluateInfix(expression);

  // Print the result
  print('Infix Expression: $expression');
  print('Evaluation Result: $result');
}

// Function to evaluate an infix expression
double evaluateInfix(String expression) {
  Stack<double> values = Stack(); // Stack to store numbers
  Stack<String> operators = Stack(); // Stack to store operators

  List<String> tokens = expression.replaceAll(' ', '').split('');

  for (var token in tokens) {
    if (isNumeric(token)) {
      // If the token is a number, push it onto the values stack
      values.push(double.parse(token));
    } else if (token == '(') {
      // If the token is an opening parenthesis, push it onto the operators stack
      operators.push(token);
    } else if (token == ')') {
      // If the token is a closing parenthesis, evaluate the expression until an opening parenthesis is found
      while (operators.peek() != '(') {
        values.push(applyOperator(operators.pop(), values.pop(), values.pop()));
      }
      operators.pop(); // Remove the opening parenthesis
    } else if (isOperator(token)) {
      // While the top of the operators stack has the same or greater precedence, apply the operator
      while (!operators.isEmpty && precedence(operators.peek()) >= precedence(token)) {
        values.push(applyOperator(operators.pop(), values.pop(), values.pop()));
      }
      // Push the current operator onto the operators stack
      operators.push(token);
    }
  }

  // Evaluate the remaining operators in the stack
  while (!operators.isEmpty) {
    values.push(applyOperator(operators.pop(), values.pop(), values.pop()));
  }

  // The final result is the last value in the values stack
  return values.pop();
}

// Helper function to check if a string is numeric
bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

// Helper function to check if a string is an operator
bool isOperator(String s) {
  return s == '+' || s == '-' || s == '*' || s == '/';
}

// Function to apply an operator on two operands
double applyOperator(String operator, double b, double a) {
  switch (operator) {
    case '+':
      return a + b;
    case '-':
      return a - b;
    case '*':
      return a * b;
    case '/':
      if (b == 0) {
        throw Exception('Division by zero');
      }
      return a / b;
    default:
      throw Exception('Unsupported operator $operator');
  }
}

// Function to get the precedence of an operator
int precedence(String operator) {
  if (operator == '+' || operator == '-') {
    return 1;
  } else if (operator == '*' || operator == '/') {
    return 2;
  }
  return 0;
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

  T peek() {
    if (_stack.isEmpty) {
      throw Exception('Stack is empty');
    }
    return _stack.last;
  }

  bool get isEmpty => _stack.isEmpty;
}
