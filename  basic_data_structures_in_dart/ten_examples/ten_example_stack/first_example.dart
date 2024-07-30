void main() {
  // Create a stack to store actions
  Stack<String> actionStack = Stack();

  // Simulate some actions
  actionStack.push('Type "Hello"');
  actionStack.push('Type "World"');
  actionStack.push('Delete "World"');
  
  // Print the current stack
  print('Current Actions: ${actionStack.items}');

  // Perform undo operation
  String lastAction = actionStack.pop();
  print('Undo: $lastAction');

  // Print the stack after undo
  print('Actions after undo: ${actionStack.items}');
}

// Stack class definition
class Stack<T> {
  List<T> _stack = [];

  // Push an item onto the stack
  void push(T value) {
    _stack.add(value);
  }

  // Pop an item from the stack
  T pop() {
    if (_stack.isEmpty) {
      throw Exception('Stack is empty');
    }
    return _stack.removeLast();
  }

  // Get all items in the stack
  List<T> get items => List.from(_stack);
}
