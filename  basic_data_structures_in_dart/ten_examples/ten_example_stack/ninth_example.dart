void main() {
  // Number of disks
  int numberOfDisks = 3;

  // Create three stacks to represent the rods
  Stack<int> source = Stack();
  Stack<int> auxiliary = Stack();
  Stack<int> destination = Stack();

  // Initialize the source rod with disks
  for (int i = numberOfDisks; i >= 1; i--) {
    source.push(i);
  }

  // Solve the Towers of Hanoi problem
  solveTowersOfHanoi(numberOfDisks, source, auxiliary, destination);

  // Print the final state of the destination rod
  print('Destination Rod: ${destination.items}');
}

// Function to solve Towers of Hanoi problem
void solveTowersOfHanoi(int n, Stack<int> source, Stack<int> auxiliary, Stack<int> destination) {
  if (n > 0) {
    // Move n-1 disks from source to auxiliary
    solveTowersOfHanoi(n - 1, source, destination, auxiliary);

    // Move the nth disk from source to destination
    destination.push(source.pop());

    // Move n-1 disks from auxiliary to destination
    solveTowersOfHanoi(n - 1, auxiliary, source, destination);
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

  List<T> get items => List.from(_stack);

  bool get isEmpty => _stack.isEmpty;
}
