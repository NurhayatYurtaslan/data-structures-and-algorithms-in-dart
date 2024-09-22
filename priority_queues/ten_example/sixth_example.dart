import 'dart:collection';

class Player {
  String name;
  int score;

  Player(this.name, this.score);
}

class GameLeaderboard {
  PriorityQueue<Player> _leaderboard;

  GameLeaderboard() {
    _leaderboard = PriorityQueue<Player>((a, b) => b.score.compareTo(a.score));
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
