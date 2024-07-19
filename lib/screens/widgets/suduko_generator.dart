import 'dart:math';

class SudokuGenerator {
  //creats list of of 9x9 with null values
  final List<List<int?>> _board =
      List.generate(9, (index) => List.filled(9, null));
  final Random _random = Random();

  List<List<int?>> generateSolvedBoard() {
    _fillBoard();
    return _board;
  }

  bool _fillBoard() {
    // iterates throug each row
    for (int row = 0; row < 9; row++) {
      // iterates through each column within the current row
      for (int col = 0; col < 9; col++) {
        //checks if the selected cell is null
        if (_board[row][col] == null) {
          //if null generates a list of numbers from 1 to 9 and shuffles them
          List<int> numbers = List.generate(9, (index) => index + 1)
            ..shuffle(_random);
          //iterates through the shuffled list of numbers and checsk if the number is valid
          for (int number in numbers) {
            //calls the _isValid function to check if the number is valid accroding to sudoku rules
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

  //boolean function  to check if numbers can be placeed or not
  bool _isValid(int row, int col, int number) {
    //checks if the number already exists in the row and column
    for (int i = 0; i < 9; i++) {
      if (_board[row][i] == number || _board[i][col] == number) {
        return false;
      }
    }

    //checks if the number already exists in the 3x3 box
    //determines the starting row and column of the 3x3 box
    // for eaxample if the row is 4 and column is 5 then
    //the boxRow and boxCol will be
    //boxRow = 4 ~/ 3 = 1 *3 = 3
    //boxCol = 5 ~/ 3 = 1 * 3 = 3
    //which gives the starting position of the 3x3 grid that is 3,3

    int boxRow = row ~/ 3 * 3;
    int boxCol = col ~/ 3 * 3;

//itersates through the 3x3 box and checks if the number already exists
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

//maoin function to create the puzzle for the sudoku
List<List<int?>> createPuzzle(List<List<int?>> solvedBoard, int clues) {
  //creats a copy of solved board in a new list puzzle
  List<List<int?>> puzzle =
      List.generate(9, (i) => List<int?>.from(solvedBoard[i]));

  //for number of cells to remove from the solved board, according to difficulty
  int cellsToRemove = 81 - clues;

  //loop continues untill the number of cells to remove are not zero

  while (cellsToRemove > 0) {
    // Randomly select a cell using Random().nextInt(9) for row and column
    int row = Random().nextInt(9);
    int col = Random().nextInt(9);

    //if the cell is not null then remove the cell and decrease the number of cells to remove
    if (puzzle[row][col] != null) {
      puzzle[row][col] = null;
      cellsToRemove--;
    }
  }

  return puzzle;
}
