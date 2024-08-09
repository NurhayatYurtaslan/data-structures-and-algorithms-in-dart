class QueueRingBuffer<E> {
  final List<E> _items = [];

  void enqueue(E item) {
    _items.add(item);
  }

  E? dequeue() {
    if (_items.isEmpty) {
      return null;
    }
    final item = _items.first;
    _items.removeAt(0);
    return item;
  }

  void addToBack(E item) {
    _items.add(item);
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;
}

extension BoardGameManager<E> on QueueRingBuffer<E> {
  E? nextPlayer() {
    if (isEmpty) {
      return null;
    }
    final currentPlayer = dequeue();
    addToBack(currentPlayer!);
    return currentPlayer;
  }
}

void main() {
  final players = ['Alice', 'Bob', 'Charlie', 'David'];
  final gameManager = QueueRingBuffer<String>();
  players.forEach(gameManager.enqueue);

  for (int i = 0; i < 10; i++) {
    final currentPlayer = gameManager.nextPlayer();
    print('It\'s $currentPlayer\'s turn!');
  }
}
