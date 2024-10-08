bool hasPairWithSum(List<int> arr, int target) {
  int n = arr.length;

  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      if (arr[i] + arr[j] == target) {
        return true;
      }
    }
  }
  return false;
}

void main() {
  List<int> arr = [10, 15, 3, 7];
  int target = 17;
  
  if (hasPairWithSum(arr, target)) {
    print('There is a pair with the sum $target.');
  } else {
    print('No pair with the sum $target.');
  }
}
