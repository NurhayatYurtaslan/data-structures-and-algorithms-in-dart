class Player {
  String name;
  int score;

  Player(this.name, this.score);
}

class CustomPriorityQueue {
  List<Player> _queue = [];

  // Listeyi skora göre sıralıyoruz (büyükten küçüğe)
  void add(Player player) {
    _queue.add(player);
    _queue.sort((a, b) => b.score.compareTo(a.score)); // Skoruna göre sırala (büyükten küçüğe)
  }

  // İlk öğeyi çıkarma
  Player removeFirst() {
    if (_queue.isNotEmpty) {
      return _queue.removeAt(0); // En yüksek skorlu oyuncuyu çıkar
    } else {
      throw Exception('Queue is empty');
    }
  }

  bool get isNotEmpty => _queue.isNotEmpty;
}

class GameLeaderboard {
  late CustomPriorityQueue _leaderboard;

  GameLeaderboard() {
    _leaderboard = CustomPriorityQueue(); // PriorityQueue yerine CustomPriorityQueue kullanılıyor
  }

  void addPlayer(String name, int score) {
    _leaderboard.add(Player(name, score));
  }

  void displayLeaderboard() {
    print('Leaderboard:');
    while (_leaderboard.isNotEmpty) {
      var player = _leaderboard.removeFirst();
      print('${player.name}: ${player.score}');
    }
  }
}

void main() {
  var leaderboard = GameLeaderboard();
  leaderboard.addPlayer('Alice', 150);
  leaderboard.addPlayer('Bob', 200);
  leaderboard.addPlayer('Charlie', 180);
  
  leaderboard.displayLeaderboard(); // Bob, Charlie, Alice
}
