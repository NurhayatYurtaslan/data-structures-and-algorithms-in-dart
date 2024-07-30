void main() {
  // Create a social network graph
  SocialNetwork socialNetwork = SocialNetwork();
  socialNetwork.addFriend('Alice', 'Bob');
  socialNetwork.addFriend('Alice', 'Charlie');
  socialNetwork.addFriend('Bob', 'David');
  socialNetwork.addFriend('Charlie', 'David');
  socialNetwork.addFriend('Charlie', 'Eve');

  // Find mutual friends between Alice and Charlie
  List<String> mutualFriends = socialNetwork.findMutualFriends('Alice', 'Charlie');
  print('Mutual friends between Alice and Charlie: $mutualFriends');

  // Find mutual friends between Bob and Charlie
  mutualFriends = socialNetwork.findMutualFriends('Bob', 'Charlie');
  print('Mutual friends between Bob and Charlie: $mutualFriends');
}

// SocialNetwork class to manage users and their friends
class SocialNetwork {
  Map<String, Set<String>> network = {};

  // Method to add a friend connection
  void addFriend(String user1, String user2) {
    if (!network.containsKey(user1)) {
      network[user1] = {};
    }
    if (!network.containsKey(user2)) {
      network[user2] = {};
    }
    network[user1]!.add(user2);
    network[user2]!.add(user1);
  }

  // Method to find mutual friends between two users
  List<String> findMutualFriends(String user1, String user2) {
    if (!network.containsKey(user1) || !network.containsKey(user2)) {
      return [];
    }

    Set<String> friendsOfUser1 = network[user1]!;
    Set<String> friendsOfUser2 = network[user2]!;

    List<String> mutualFriends = friendsOfUser1.intersection(friendsOfUser2).toList();
    return mutualFriends;
  }
}
