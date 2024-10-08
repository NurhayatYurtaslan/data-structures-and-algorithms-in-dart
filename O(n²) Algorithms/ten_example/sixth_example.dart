void zeroMatrix(List<List<int>> matrix) {
  int rows = matrix.length;
  int cols = matrix[0].length;

  List<int> zeroRows = [];
  List<int> zeroCols = [];

  // Sıfır olan hücreleri bul
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (matrix[i][j] == 0) {
        zeroRows.add(i);
        zeroCols.add(j);
      }
    }
  }

  // Sıfırlanacak satırları sıfırla
  for (var row in zeroRows) {
    for (int j = 0; j < cols; j++) {
      matrix[row][j] = 0;
    }
  }

  // Sıfırlanacak sütunları sıfırla
  for (var col in zeroCols) {
    for (int i = 0; i < rows; i++) {
      matrix[i][col] = 0;
    }
  }

  print('Zeroed Matrix:');
  matrix.forEach((row) => print(row));
}

void main() {
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 0, 6],
    [7, 8, 9]
  ];

  zeroMatrix(matrix);
  // Output: [1, 0, 3], [0, 0, 0], [7, 0, 9]
}
