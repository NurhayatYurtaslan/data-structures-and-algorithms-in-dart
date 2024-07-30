void main() {
  // Create a min stack
  MinStack minStack = MinStack();

  // Push elements onto the stack
  minStack.push(5);
  minStack.push(3);
  minStack.push(7);
  minStack.push(2);

  // Get the minimum element
  print('Minimum: ${minStack.getMin()}'); // Outputs 2

  // Pop an element
  minStack.pop();

  // Get the minimum element after popping
  print('Minimum after pop: ${minStack.getMin()}'); // Outputs 3
}

// MinStack class definition
class MinStack {
  Stack<int> mainStack = Stack();
  Stack<int> minStack = Stack();

  // Push an element onto the stack
  void push(int value) {
    mainStack.push(value);
    if (minStack.isEmpty || value <= minStack.peek()) {
      minStack.push(value);
    }
  }

  // Pop an element from the stack
  int pop() {
    int value = mainStack.pop();
    if (value == minStack.peek()) {
      minStack.pop();
    }
    return value;
  }

  // Get the minimum element from the stack
  int getMin() {
    if (minStack.isEmpty) {
      throw Exception('Stack is empty');
    }
    return minStack.peek();
  }
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
