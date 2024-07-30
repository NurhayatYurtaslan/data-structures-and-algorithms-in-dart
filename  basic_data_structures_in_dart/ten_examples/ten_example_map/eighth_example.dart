void main() {
  // Create a Trie and insert words
  Trie trie = Trie();
  trie.insert('apple');
  trie.insert('app');
  trie.insert('apricot');
  trie.insert('banana');

  // Search for words in the Trie
  print('Search for "apple": ${trie.search('apple')}'); // true
  print('Search for "app": ${trie.search('app')}'); // true
  print('Search for "apricot": ${trie.search('apricot')}'); // true
  print('Search for "banana": ${trie.search('banana')}'); // true
  print('Search for "bat": ${trie.search('bat')}'); // false

  // Check if prefix exists
  print('Prefix "ap" exists: ${trie.startsWith('ap')}'); // true
  print('Prefix "ba" exists: ${trie.startsWith('ba')}'); // true
  print('Prefix "bat" exists: ${trie.startsWith('bat')}'); // false
}

// TrieNode class represents each node in the Trie
class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

// Trie class for handling insert and search operations
class Trie {
  TrieNode root = TrieNode();

  // Method to insert a word into the Trie
  void insert(String word) {
    TrieNode currentNode = root;
    for (var char in word.split('')) {
      if (!currentNode.children.containsKey(char)) {
        currentNode.children[char] = TrieNode();
      }
      currentNode = currentNode.children[char]!;
    }
    currentNode.isEndOfWord = true;
  }

  // Method to search for a word in the Trie
  bool search(String word) {
    TrieNode? node = _searchNode(word);
    return node != null && node.isEndOfWord;
  }

  // Method to check if a prefix exists in the Trie
  bool startsWith(String prefix) {
    return _searchNode(prefix) != null;
  }

  // Helper method to search for a node in the Trie
  TrieNode? _searchNode(String prefix) {
    TrieNode currentNode = root;
    for (var char in prefix.split('')) {
      if (!currentNode.children.containsKey(char)) {
        return null;
      }
      currentNode = currentNode.children[char]!;
    }
    return currentNode;
  }
}
