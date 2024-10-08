void findSubarraysWithSum(List<int> arr, int target) {
  int n = arr.length;

  for (int i = 0; i < n; i++) {
    int currentSum = 0;
    
    for (int j = i; j < n; j++) {
      currentSum += arr[j];
      
      if (currentSum == target) {
        print('Subarray from index $i to $j sums to $target');
      }
    }
  }
}

void main() {
  List<int> arr = [3, 4, -2, 1, -6, 8, 4, 1];
  int target = 7;
  
  findSubarraysWithSum(arr, target); 
  // Output: Subarray from index 0 to 1, Subarray from index 3 to 6
}
