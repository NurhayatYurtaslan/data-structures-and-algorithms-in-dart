void main() {
  // Sample Sudoku puzzle (0 represents empty cells)
  List<List<int>> sudokuBoard = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9],
  ];

  // Solve the Sudoku puzzle
  if (solveSudoku(sudokuBoard)) {
    print('Sudoku Solved:');
    for (var row in sudokuBoard) {
      print(row);
    }
  } else {
    print('No solution exists.');
  }
}

// Function to solve Sudoku using backtracking
bool solveSudoku(List<List<int>> board) {
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      if (board[row][col] == 0) {
        for (int num = 1; num <= 9; num++) {
          if (isSafe(board, row, col, num)) {
            board[row][col] = num;
            if (solveSudoku(board)) {
              return true;
            }
            board[row][col] = 0;
          }
        }
        return false;
      }
    }
  }
  return true;
}

// Function to check if it's safe to place a number in a cell
bool isSafe(List<List<int>> board, int row, int col, int num) {
  // Check row
  for (int x = 0; x < 9; x++) {
    if (board[row][x] == num) {
      return false;
    }
  }

  // Check column
  for (int x = 0; x < 9; x++) {
    if (board[x][col] == num) {
      return false;
    }
  }

  // Check 3x3 box
  int startRow = row - row % 3;
  int startCol = col - col % 3;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i + startRow][j + startCol] == num) {
        return false;
      }
    }
  }

  return true;
}
