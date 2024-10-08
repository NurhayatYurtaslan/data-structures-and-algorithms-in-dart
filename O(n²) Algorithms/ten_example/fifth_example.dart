void findPairsWithSum(List<int> arr, int target) {
  int n = arr.length;

  for (int i = 0; i < n - 1; i++) {
    for (int j = i + 1; j < n; j++) {
      if (arr[i] + arr[j] == target) {
        print('Pair found: (${arr[i]}, ${arr[j]})');
      }
    }
  }
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5];
  int target = 5;
  
  findPairsWithSum(arr, target);
  // Output: (1, 4) and (2, 3)
}
