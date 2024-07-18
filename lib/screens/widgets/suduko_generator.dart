import 'dart:math';

class SudokuGenerator {
  final List<List<int?>> _board =
      List.generate(9, (index) => List.filled(9, null));
  final Random _random = Random();

  List<List<int?>> generateSolvedBoard() {
    _fillBoard();
    return _board;
  }

  bool _fillBoard() {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (_board[row][col] == null) {
          List<int> numbers = List.generate(9, (index) => index + 1)
            ..shuffle(_random);
          for (int number in numbers) {
            if (_isValid(row, col, number)) {
              _board[row][col] = number;
              if (_fillBoard()) {
                return true;
              }
              _board[row][col] = null;
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  bool _isValid(int row, int col, int number) {
    for (int i = 0; i < 9; i++) {
      if (_board[row][i] == number || _board[i][col] == number) {
        return false;
      }
    }

    int boxRow = row ~/ 3 * 3;
    int boxCol = col ~/ 3 * 3;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_board[boxRow + i][boxCol + j] == number) {
          return false;
        }
      }
    }

    return true;
  }
}

List<List<int?>> createPuzzle(List<List<int?>> solvedBoard, int clues) {
  List<List<int?>> puzzle =
      List.generate(9, (i) => List<int?>.from(solvedBoard[i]));
  int cellsToRemove = 81 - clues;

  while (cellsToRemove > 0) {
    int row = Random().nextInt(9);
    int col = Random().nextInt(9);
    if (puzzle[row][col] != null) {
      puzzle[row][col] = null;
      cellsToRemove--;
    }
  }

  return puzzle;
}
