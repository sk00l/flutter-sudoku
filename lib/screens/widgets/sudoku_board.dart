import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sudoku/constants/game_sizes.dart';
import 'package:sudoku/screens/shared/action_buttons.dart';
import 'package:sudoku/screens/shared/app_hortizontal_lines.dart';
import 'package:sudoku/screens/shared/app_vertical_lines.dart';
import 'package:sudoku/screens/widgets/keypad_widget.dart';
import 'package:sudoku/screens/widgets/suduko_generator.dart';

class SudokuBoard extends StatefulWidget {
  const SudokuBoard({super.key});

  @override
  State<SudokuBoard> createState() => _SudokuBoardState();
}

class _SudokuBoardState extends State<SudokuBoard> {
  int? selectedRow;
  int? selectedCol;
  late List<List<int?>> puzzleBoard;
  late List<List<int?>> solvedBoard;

  List<List<bool>> nonErasableCells =
      List.generate(9, (index) => List.filled(9, false));

  double screenWidth = GameSizes.getWidth(1);
  double borderWidth = GameSizes.getWidth(0.006);
  double cellBorderWidth = GameSizes.getWidth(0.004);

  @override
  void initState() {
    super.initState();
    SudokuGenerator generator = SudokuGenerator();
    solvedBoard = generator.generateSolvedBoard();
    puzzleBoard =
        createPuzzle(solvedBoard, 25); // Change clue count for difficulty
    _setNonErasableCells();
  }

  void _setNonErasableCells() {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (puzzleBoard[row][col] != null) {
          nonErasableCells[row][col] = true;
        }
      }
    }
  }

  void _onCellTap(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  void _onKeyPressed(int number) {
    if (selectedRow != null &&
        selectedCol != null &&
        !nonErasableCells[selectedRow!][selectedCol!]) {
      setState(() {
        puzzleBoard[selectedRow!][selectedCol!] = number;
      });
    }
  }

  void _onDeletePressed() {
    if (selectedRow != null &&
        selectedCol != null &&
        !nonErasableCells[selectedRow!][selectedCol!]) {
      setState(() {
        puzzleBoard[selectedRow!][selectedCol!] = null;
      });
    }
  }

  bool _isHighlighted(int row, int col) {
    if (selectedRow == null || selectedCol == null) return false;
    int selectedBoxRow = selectedRow! ~/ 3;
    int selectedBoxCol = selectedCol! ~/ 3;
    int boxRow = row ~/ 3;
    int boxCol = col ~/ 3;

    return row == selectedRow ||
        col == selectedCol ||
        (boxRow == selectedBoxRow && boxCol == selectedBoxCol);
  }

  bool _isSelected(int row, int col) {
    return row == selectedRow && col == selectedCol;
  }

  void _applyHint() {
    if (selectedRow != null && selectedCol != null) {
      setState(() {
        puzzleBoard[selectedRow!][selectedCol!] =
            solvedBoard[selectedRow!][selectedCol!];
        nonErasableCells[selectedRow!][selectedCol!] = true;
      });
    }
  }

  void _solvePuzzle() {
    setState(() {
      for (int row = 0; row < 9; row++) {
        for (int col = 0; col < 9; col++) {
          puzzleBoard[row][col] = solvedBoard[row][col];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: screenWidth - GameSizes.getWidth(0.06),
          margin: GameSizes.getHorizontalPadding(0.01),
          decoration: BoxDecoration(
            border: Border.all(
              width: borderWidth,
            ),
          ),
          child: Stack(
            children: [
              VerticalLines(
                  borderWidth: borderWidth, borderColor: Colors.black),
              HorizontalLines(
                  borderWidth: borderWidth, borderColor: Colors.black),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9,
                  mainAxisSpacing: cellBorderWidth,
                  crossAxisSpacing: cellBorderWidth,
                ),
                itemCount: 81,
                itemBuilder: (context, index) {
                  int row = index ~/ 9;
                  int col = index % 9;
                  bool isHighlighted = _isHighlighted(row, col);
                  bool isSelected = _isSelected(row, col);
                  return InkWell(
                    onTap: () {
                      _onCellTap(row, col);
                    },
                    child: CellWidget(
                      isHighlighted: isHighlighted,
                      isSelected: isSelected,
                      number: puzzleBoard[row][col],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const Gap(12),
        KeypadWidget(
          onKeyPressed: _onKeyPressed,
          onDeletePressed: _onDeletePressed,
        ),
        const Gap(12),
        SizedBox(
          height: 80,
          child: ActionButtons(onHint: _applyHint, onSolve: _solvePuzzle),
        )
      ],
    );
  }
}

class CellWidget extends StatelessWidget {
  final bool isHighlighted;
  final bool isSelected;
  final int? number;

  const CellWidget({
    super.key,
    required this.isHighlighted,
    required this.isSelected,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xff87A96B)
            : (isHighlighted
                ? const Color.fromARGB(255, 226, 243, 215)
                : Colors.white),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      padding: GameSizes.getPadding(0.005),
      child: Center(
        child: Text(
          number?.toString() ?? '',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
