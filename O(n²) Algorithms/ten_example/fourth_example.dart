void multiplyMatrices(List<List<int>> matrixA, List<List<int>> matrixB) {
  int rowsA = matrixA.length;
  int colsA = matrixA[0].length;
  int colsB = matrixB[0].length;
  
  List<List<int>> result = List.generate(rowsA, (_) => List.filled(colsB, 0));

  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      for (int k = 0; k < colsA; k++) {
        result[i][j] += matrixA[i][k] * matrixB[k][j];
      }
    }
  }

  print('Resultant Matrix:');
  result.forEach((row) => print(row));
}

void main() {
  List<List<int>> matrixA = [
    [1, 2],
    [3, 4]
  ];
  List<List<int>> matrixB = [
    [5, 6],
    [7, 8]
  ];

  multiplyMatrices(matrixA, matrixB);
  // Output: [19, 22], [43, 50]
}
