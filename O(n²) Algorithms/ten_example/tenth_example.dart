int lcs(String str1, String str2) {
  int m = str1.length;
  int n = str2.length;

  List<List<int>> lcsMatrix = List.generate(m + 1, (_) => List.filled(n + 1, 0));

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (str1[i - 1] == str2[j - 1]) {
        lcsMatrix[i][j] = lcsMatrix[i - 1][j - 1] + 1;
      } else {
        lcsMatrix[i][j] = lcsMatrix[i - 1][j].max(lcsMatrix[i][j - 1]);
      }
    }
  }

  return lcsMatrix[m][n];
}

void main() {
  String str1 = 'AGGTAB';
  String str2 = 'GXTXAYB';

  int length = lcs(str1, str2);
  print('Length of LCS is $length'); // Output: 4
}
