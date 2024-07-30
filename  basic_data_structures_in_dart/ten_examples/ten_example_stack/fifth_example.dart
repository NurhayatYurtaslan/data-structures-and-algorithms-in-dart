void main() {
  // Create browser history
  BrowserHistory browserHistory = BrowserHistory();

  // Visit some pages
  browserHistory.visitPage('home.com');
  browserHistory.visitPage('about.com');
  browserHistory.visitPage('contact.com');

  // Go back and forward in history
  print('Current Page: ${browserHistory.currentPage()}');
  browserHistory.goBack();
  print('After going back: ${browserHistory.currentPage()}');
  browserHistory.goForward();
  print('After going forward: ${browserHistory.currentPage()}');
}

// BrowserHistory class definition
class BrowserHistory {
  Stack<String> backStack = Stack();
  Stack<String> forwardStack = Stack();
  String? current;

  // Visit a new page
  void visitPage(String url) {
    if (current != null) {
      backStack.push(current!);
    }
    current = url;
    forwardStack = Stack(); // Clear forward history
  }

  // Go back to the previous page
  void goBack() {
    if (!backStack.isEmpty) {
      forwardStack.push(current!);
      current = backStack.pop();
    }
  }

  // Go forward to the next page
  void goForward() {
    if (!forwardStack.isEmpty) {
      backStack.push(current!);
      current = forwardStack.pop();
    }
  }

  // Get the current page
  String currentPage() {
    return current ?? 'No page';
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

  bool get isEmpty => _stack.isEmpty;
}
